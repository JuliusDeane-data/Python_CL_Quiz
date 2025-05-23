import tkinter
from .game_logic import Game
from .db_handler import Db_handler
from .input_handler import (
    check_int_input,
    check_str_input_blacklist,
    check_str_input_whitelist,
    set_password,
    check_password,
    slow_print
)


class CLI_Menu:
    def __init__(self, player):
        self.player = player
        self.status = True

        self.main_menu_choices = {
            1: "New Game",
            2: "See Progress",
            3: "Reset Progress",
            4: "Add Question",
            5: "Quit Game",
        }

        self.difficulty_levels = {
            1: "It's all computer!",
            2: "Vibe coder",
            3: "1 c4n r34d th1s",
            5: "DCI Coach"
        }

        self.topics = {
            1: "General Python",
            2: "Functions",
            3: "Classes",
            4: "File Handling",
        }

    def main_menu(self):
        """Main Menu. Shows options and takes player inputs."""
        while self.status:
            slow_print("#__MAIN MENU__#")
            for key, value in self.main_menu_choices.items():
                slow_print(f"{key}. {value}")
            menu_choice = check_int_input(
                "Make your choice: ", (1, len(self.main_menu_choices) + 1)
            )
            print("\n")
            if menu_choice == 1:
                self.new_game()
            elif menu_choice == 2:
                Game(self.player).show_player_scores()
            elif menu_choice == 3:
                Game(self.player).reset_answered_questions()
            elif menu_choice == 4:
                Game(self.player).add_question()
            elif menu_choice == 5:
                slow_print("Thank you for playing."
                           f"\nSee you next time, {self.player}!")
                self.status = False

    def new_game(self):
        """
        Setups a new game round. Calls other methods to set topic,
        difficulty and number of rounds.
        Creates a Game object.
        """
        slow_print("__Setup New Game__\n")
        topic = self.set_topic()
        difficulty = self.set_difficulty()
        rounds = self.set_rounds()
        g = Game(
            player=self.player,
            total_rounds=rounds,
            topic=topic,
            difficulty=difficulty
        )
        print("\n")
        g.game_round()

    def set_topic(self):
        slow_print("Choose topic:")
        for key, value in self.topics.items():
            slow_print(f"{key}. {value}")
        topic_choice = check_int_input(
            text="Your choice (1-4): ",
            int_range=(1, 5)
        )
        return self.topics[topic_choice]

    def set_difficulty(self):
        slow_print("Choose difficulty:")
        for key, value in self.difficulty_levels.items():
            slow_print(f"{key}. {value}")
        diff_choice = check_int_input(
            text="Your choice (1-5): ",
            int_range=(1, 6),
            exclude=[4]
        )
        return diff_choice

    def set_rounds(self):
        rounds = check_int_input(
            text="Enter number of rounds (1-12): ",
            int_range=(1, 13)
        )
        return rounds


class Login(Db_handler):
    def __init__(self):
        self.player_list = self.get_player_list()
        self.player = ""

    def new_player(self):
        player_name = check_str_input_blacklist(
            "Insert player name: ", self.player_list
        )
        password = set_password()
        if password:
            self.add_player(player_name, password)
            self.player = player_name
            self.login_success()
        else:
            self.login_fail()

    def existing_player(self):
        player_name = check_str_input_whitelist(
            "Insert player name: ", self.player_list
        )
        player_password = self.get_password(player_name)
        password = check_password("Insert password: ", player_password)
        if password:
            self.player = player_name
            self.login_success()
        else:
            self.login_fail()

    def login_screen(self):
        slow_print("##__THE PYTHON QUIZ__##", 5)
        slow_print("1. Login existing player\n2. Add new player", 3)
        choice = check_int_input("Your choice (1-2): ", (1, 3))
        print("\n")
        if choice == 1:
            self.existing_player()
        elif choice == 2:
            self.new_player()
        return self.player

    def login_success(self):
        print(f"\nLogin succesful as player: '{self.player}'")
        m = CLI_Menu(self.player)
        m.main_menu()

    def login_fail(self):
        print("\nLogin failed. Please try again later.")


if __name__ == "__main__":
    login = Login()
    player = login.login_screen()
    if player:
        m = CLI_Menu(player)
        m.main_menu()
