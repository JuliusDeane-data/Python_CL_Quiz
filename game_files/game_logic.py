from .db_handler import Db_handler
import random
from .input_handler import check_int_input, check_str_input_whitelist, slow_print


class Game(Db_handler):
    def __init__(self, player, total_rounds=5, topic=1, difficulty=1):
        self.questions = {}
        self.player = player
        self.topic = topic
        self.score = 0
        self.rounds = 0
        self.total_rounds = total_rounds
        self.difficulty = difficulty
        self.id_list = []
        self.corr_answer_letter = ""
        self.corr_answers_dict = self.get_answered_questions(player)

    def load_questions(self, topic: str, difficulty: int) -> None:
        """
        Loads the questions from the database
        and stores them in self.questions
        """
        questions = self.get_questions(topic, difficulty)
        self.questions = questions

    def show_question(self, id: int) -> str:
        """Retuns the question to the id."""
        return self.questions[id]["question"]

    def show_answers(self, id: int) -> str:
        """Returns a formatted string with the answers options."""
        answers = self.questions[id]["answers"]
        corr_answer = answers[0]
        random.shuffle(answers)
        self.corr_answer_letter = "abcd"[answers.index(corr_answer)]
        return f"a: {answers[0]}\nb: {answers[1]}\nc: {answers[2]}\nd: {answers[3]}"  # noqa

    def check_answer(self, id: int, answer: str) -> str:
        """
        Returns a formatted string with a message,
        if the given answer was correct.
        Updates the score and and the list of correct answers.
        """
        if answer == self.corr_answer_letter:
            self.score += self.questions[id]["difficulty"]
            self.corr_answers_dict[self.topics[self.topic]].append(id)
            return f"Correct! New score: {self.score}"
        else:
            return f"False! Your score: {self.score}"

    def make_id_list(self) -> None:
        """
        Creates id_list for game round from question list
        minus list of already answered question (feature not yet implemented)
        """
        self.id_list = [
            key
            for key in self.questions.keys()
            if key not in self.corr_answers_dict[self.topics[self.topic]]
        ]

    def check_enough_questions(self) -> bool:
        """
        Checks if the number of total rounds is not bigger
        than the number of available questions. Automatically
        sets rounds to number of available questions if that's the case.
        """
        if len(self.id_list) < self.total_rounds:
            self.total_rounds = len(self.id_list)
            return False
        return True

    def reset_answered_questions(self):
        assure = check_str_input_whitelist(
            "This will reset your list of answered questions.\nDo you want to proceed? ('y'/'n'): ",  # noqa
            ['y', 'n', 'Y', 'N'])
        if assure == 'y':
            self.add_answered_questions(self.player, self.empty_answ_dict)
            slow_print("All reset.")
        else:
            slow_print("Process aborted.")

    def pick_question(self) -> int:
        """Returns the id of a randomly picked question"""
        id = random.choice(self.id_list)
        self.id_list.remove(id)
        return id

    def question_round(self):
        """
        One question round.
        This will pick and show one question
        and check the answer.
        """
        slow_print(f"Round {self.rounds} of {self.total_rounds}:")
        id = self.pick_question()
        slow_print(self.show_question(id))
        slow_print(self.show_answers(id))
        answer = check_str_input_whitelist(
            "Your answer: ",
            ["a", "b", "c", "d"],
            show_list=True)
        slow_print(self.check_answer(id, answer))

    def game_round(self):
        """
        One quiz round.
        Load the questions and play a certain number of question rounds
        """
        self.load_questions(self.topic, self.difficulty)
        self.make_id_list()
        if not self.check_enough_questions():
            slow_print(f"Not enough questions available. "
                  f"Number of rounds set to {self.total_rounds}")
        while self.rounds < self.total_rounds:
            self.rounds += 1
            self.question_round()
        else:
            self.add_answered_questions(self.player, self.corr_answers_dict)
            slow_print(f"Game over. Your total score is: {self.score}.")

    def add_question(self):
        while True:
            text = input("Insert question: ")
            corr_answer = input("Insert correct answer: ")
            w1_ans = input("Insert wrong answer (1/3): ")
            w2_ans = input("Insert wrong answer (2/3): ")
            w3_ans = input("Insert wrong answer (3/3): ")
            n = 1
            print("Choose a category:")
            for key in self.topics.keys():
                print(f"{n}. {key}")
                n += 1
            cat = list(self.topics.keys())[check_int_input(
                "Your choice: ",
                (1, n))-1]
            diff = check_int_input(
                "Insert difficulty (1, 2, 3, 5): ",
                (1, 6), [4]
                )
            question = {
                "category": cat,
                "difficulty": diff,
                "question": text,
                "correct answer": corr_answer,
                "wrong answers": [w1_ans, w2_ans, w3_ans],
            }

            print("-- Input complete. Please review your question --")
            for key, value in question.items():
                print(f"{key} => {value}")
            correct = check_int_input(
                text="1. Add question and leave\n2. Discard question and start again\n3. Discard question and leave\nYour choice: ", int_range=(1, 4)  # noqa
            )
            if correct == 1:
                question["category"] = self.topics[cat]
                self.add_new_question(self.player, question)
                return "Question added. Thank you!"
            elif correct == 2:
                print("Question discarded. Enter new question.")
            else:
                return "Question discarded. Returning to Main Menu."

    def show_player_scores(self):
        total_questions = self.get_num_questions_per_cat()
        for item in self.corr_answers_dict.keys():
            topic = next((k for k, v in self.topics.items() if v == item), None)  # noqa
            slow_print(f"__{topic}__", 2)
            slow_print(f"{len(self.corr_answers_dict[item])} / {sum(total_questions[item])} questions answered.\n", 2)  # noqa
        input("Press any key to continue.\n")


if __name__ == "__main__":
    game = Game("Philip")
    answers = game.corr_answers_dict
    print(answers.values())
    answ_l = [n for n in answers.values()]
    summ = sum(len[n] for n in answers.values() if n)
    print(summ)
