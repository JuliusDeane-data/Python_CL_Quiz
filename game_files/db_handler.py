import psycopg2 as psy
import json
from .config import config


class Db_handler:
    topics = {"General Python": "q_general", "Functions": "q_functions", "Classes": "q_classes", "File Handling": "q_file_handling"}

    empty_answ_dict = {topics["General Python"]: [], topics["Functions"]: [], topics["Classes"]: [], topics["File Handling"]: []}

    def questions_to_dict(self, data: set) -> dict:
        return {
            id: {
                "question": question,
                "answers": [corr, wr1, wr2, wr3],
                "difficulty": difficulty,
            }
            for id, question, corr, wr1, wr2, wr3, difficulty in data
        }

    def get_questions(self, topic: str, difficulty: int) -> dict:
        conn = psy.connect(**config)
        cursor = conn.cursor()
        query = f"SELECT id, question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty FROM {self.topics[topic]} WHERE difficulty=%s;" # noqa
        values = (difficulty,)
        cursor.execute(query, values)
        questions = self.questions_to_dict(cursor.fetchall())
        conn.close()
        return questions

    def get_num_questions_per_cat(self) -> dict:
        conn = psy.connect(**config)
        cursor = conn.cursor()
        query = "SELECT * FROM questions_per_diff_and_cat;"
        cursor.execute(query)
        data = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        questions_per_cat = {columns[n]: [x[n] for x in data] for n in range(1, len(columns))} # noqa
        conn.close()
        return questions_per_cat

    def add_player(self, name: str, password: str) -> None:
        conn = psy.connect(**config)
        cursor = conn.cursor()
        query = "INSERT INTO player (name, password) VALUES (%s, %s);"
        values = (name, password)
        cursor.execute(query, values)
        conn.commit()
        conn.close()

    def get_player_list(self) -> list:
        conn = psy.connect(**config)
        cursor = conn.cursor()
        cursor.execute("SELECT name FROM player;")
        player_list = [x[0] for x in cursor.fetchall()]
        conn.close()
        return player_list

    def get_password(self, name: str) -> memoryview:
        conn = psy.connect(**config)
        cursor = conn.cursor()
        query = "SELECT password FROM player WHERE name=%s;"
        values = (name,)
        cursor.execute(query, values)
        password = cursor.fetchall()[0][0]
        conn.close()
        return password

    def get_answered_questions(self, name: str) -> dict:
        conn = psy.connect(**config)
        cursor = conn.cursor()
        query = "SELECT answered_questions FROM player WHERE name=%s;"
        values = (name,)
        cursor.execute(query, values)
        answers = cursor.fetchall()[0][0]
        if not answers:
            answers = self.empty_answ_dict
        conn.close()
        return answers

    def add_answered_questions(self, name: str, answered_questions: dict) -> None:
        answ_json = json.dumps(answered_questions)
        conn = psy.connect(**config)
        cursor = conn.cursor()
        query = "UPDATE player SET answered_questions=%s WHERE name=%s;"
        values = (answ_json, name)
        cursor.execute(query, values)
        conn.commit()
        conn.close()

    def add_new_question(self, player: str, question: dict) -> None:
        conn = psy.connect(**config)
        cursor = conn.cursor()
        query = f"""
        INSERT INTO {question["category"]}
        (question, correct_answer, wrong_1, wrong_2, wrong_3, difficulty, added_by)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        values = (
            question["question"],
            question["correct answer"],
            question["wrong answers"][0],
            question["wrong answers"][1],
            question["wrong answers"][2],
            question["difficulty"],
            player
        )
        cursor.execute(query, values)
        conn.commit()
        conn.close()


if __name__ == "__main__":
    db = Db_handler()
    q= db.get_num_questions_per_cat()
    print(q)
    for n in q.items():
        print(n[0])
        print(sum(n[1]))

    # for n in range(0, len(col)-1):
    #     print(col[n])
    #     for x in num_q:
    #         print(x[n])
