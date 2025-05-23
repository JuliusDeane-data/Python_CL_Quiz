import bcrypt
import base64
import getpass
import time


def check_int_input(text: str, int_range: tuple = (1, 999999), exclude: list = []) -> str:
    choice = ""
    while not choice:
        try:
            choice = int(input(text))
        except ValueError:
            print("Wrong input. Please only input a number.")
            choice = ""
        if (choice not in range(*int_range) or choice in exclude) and isinstance(
            choice, int
        ):
            print("Number out of range. Please choose a valid number.")
            choice = ""
    else:
        return choice


def check_str_input_whitelist(
    text: str, whitelist: list, show_list: bool = False
) -> str:
    """
    Prompts user for input until a string in the whitelist is entered.

    Args:
        text (str): The prompt text displayed to the user.
        whitelist (list): List of allowed string inputs.
        show_list (bool): If True, displays the full whitelist in the error message.

    Returns:
        str: A valid input string present in the whitelist.
    """
    choice = ""
    while not choice:
        choice = input(text)
        if choice not in whitelist and show_list:
            print(f"Wrong input. Allowed input: {", ".join(whitelist)}.")
            choice = ""
        elif choice not in whitelist and not show_list:
            print(f"Wrong input. '{choice}' not allowed. Please try again.")
            choice = ""
    else:
        return choice


def check_str_input_blacklist(
    text: str, blacklist: list, show_list: bool = False
) -> str:
    """
    Prompts user for input until a string not in the blacklist is entered.

    Args:
        text (str): The prompt text displayed to the user.
        blacklist (list): List of disallowed string inputs.
        show_list (bool): If True, displays the full blacklist in the error message.

    Returns:
        str: A valid input string not present in the blacklist.
    """
    choice = ""
    while not choice:
        choice = input(text)
        if choice in blacklist and show_list:
            print(f"Wrong input. Do not use: {", ".join(blacklist)}.")
            choice = ""
        elif choice in blacklist and not show_list:
            print(f"Wrong input. '{choice}' not allowed. Please try again.")
            choice = ""
    else:
        return choice


def set_password() -> str:
    """
    Prompts the user to create and confirm a new password.

    The password must be between 6 and 25 characters long. The user is prompted
    twice to ensure the password is entered correctly. If both entries match,
    the password is hashed using bcrypt and encoded with base64 before being returned.

    Returns:
        str: The base64-encoded bcrypt hash of the password if successful.
        None: If the password confirmation fails.
    """
    password = ""
    while not password:
        password = getpass.getpass("Insert password: ")
        if not 6 <= len(password) <= 25:
            print("Not allowed. Password must be between 6 and 25 characters.")
            password = ""
        else:
            if check_password("Repeat password: ", password, False):
                hashed_pw = bcrypt.hashpw(password.encode(), bcrypt.gensalt())
                hashed_pw_base64 = base64.b64encode(hashed_pw).decode("utf-8")
                return hashed_pw_base64
            else:
                return None


def check_password(text: str, password: str, encoded: bool=True) -> bool:
    """
    Prompt the user for a password and compare it to the given reference password.

    Parameters:
    text (str): Prompt text shown to the user.
    password (str): The reference password to compare against. If encoded is True,
                    this must be a base64-encoded bcrypt hash. Otherwise, a plaintext password.
    encoded (bool): If True, password is treated as base64-encoded bcrypt hash. Defaults to True.

    Returns:
    bool: True if the user enters the correct password within 3 attempts, False otherwise.
    """
    if encoded:
        player_password = base64.b64decode(password)
    else:
        player_password = password
    success = False
    n = 3
    while not success and n > 0:
        pw_input = getpass.getpass(text)
        if encoded:
            success = bcrypt.checkpw(pw_input.encode(), player_password)
        else:
            success = (password == pw_input)
        if not success:
            n -= 1
            print(f"Wrong password. {n}/3 attempts left.")
    return success


def slow_print(text: str, speed: int | None = 3) -> None:
    """
    Prints the input text with a delay between characters.
    Base delay: 0.01 seconds.
    Standard delay: 0.03 seconds.
    Higher number = Longer delay
    Adds "\n" at the end.
    """
    for n in text:
        print(n, end="", flush=True)
        time.sleep(0.01*speed)
    print("\n")


if __name__ == "__main__":
    slow_print("This is a\ntest text!", 8)
