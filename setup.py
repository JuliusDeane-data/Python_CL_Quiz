import os
import subprocess
import getpass
import sys
from pathlib import Path

def install_requirements():
    print("Installing Python dependencies...")
    subprocess.run([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"], check=True)

def check_postgres_installed():
    try:
        subprocess.run(["psql", "--version"], check=True, stdout=subprocess.DEVNULL)
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("PostgreSQL is not installed or 'psql' is not in the system PATH.")
        sys.exit(1)

def get_postgres_credentials():
    print("Please enter your PostgreSQL credentials:")
    user = input("Username: ").strip()
    password = getpass.getpass("Password: ")
    host = input("Host (default: localhost): ").strip() or "localhost"
    port = input("Port (default: 5432): ").strip() or "5432"
    return user, password, host, port

def create_database(user, password, host, port):
    env = os.environ.copy()
    env["PGPASSWORD"] = password

    result = subprocess.run(
        ["psql", "-U", user, "-h", host, "-p", port, "-tc",
         "SELECT 1 FROM pg_database WHERE datname='python_quiz';"],
        env=env,
        capture_output=True,
        text=True,
        input='',
    )

    if "1" not in result.stdout:
        print("Creating database 'python_quiz'...")
        subprocess.run(
            ["createdb", "-U", user, "-h", host, "-p", port, "python_quiz"],
            env=env,
            check=True
        )
    else:
        print("Database 'python_quiz' already exists.")

def import_dump(user, password, host, port):
    dump_path = Path("data/quiz_dump.sql")
    if not dump_path.exists():
        print(f"Dump file {dump_path} not found. Skipping import.")
        return

    print("Importing database dump...")
    env = os.environ.copy()
    env["PGPASSWORD"] = password
    subprocess.run(
        ["psql", "-U", user, "-h", host, "-p", port, "-d", "python_quiz", "-f", str(dump_path)],
        env=env,
        check=True
    )

def write_config_py(user, password, host, port):
    config_path = Path("game_files/config.py")
    config_path.parent.mkdir(parents=True, exist_ok=True)

    with open(config_path, "w") as f:
        f.write("config = {\n")
        f.write(f"    'user': '{user}',\n")
        f.write(f"    'password': '{password}',\n")
        f.write(f"    'host': '{host}',\n")
        f.write(f"    'port': '{port}',\n")
        f.write("    'database': 'python_quiz'\n")
        f.write("}\n")

    print(f"Configuration file created: {config_path}")

if __name__ == "__main__":
    install_requirements()
    check_postgres_installed()
    user, password, host, port = get_postgres_credentials()
    create_database(user, password, host, port)
    import_dump(user, password, host, port)
    write_config_py(user, password, host, port)
    print("Setup complete.")
