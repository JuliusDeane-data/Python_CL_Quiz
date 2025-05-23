# Python Command Line Quiz

This is a command line quiz game about Python. It includes multiple categories, difficulty levels, user accounts, and question tracking.

## 🧩 Features

- Multiple-choice questions on Python topics
- Categories and difficulty levels
- User registration and login
- Tracks user progress (no repeated questions)
- Users can submit their own questions
- All data is stored in a PostgreSQL database

## 🚀 Getting Started

These steps will set up the quiz and database on your system.

### 1. Requirements

- Python 3.6+
- PostgreSQL installed and available via `psql` command

### 2. Run the Setup

Run the setup script:

```bash
python setup.py
```

The setup script will:

- Check if PostgreSQL is installed
- Ask you for your PostgreSQL username, password, host, and port
- Create the database `python_quiz`
- Import the data from `data/quiz_dump.sql`
- Create a `config.py` file in `game_files/` with your credentials

⚠️⚠️⚠️

If PostgreSQL is installed on your system, 
but the setup.py can't find it, try this on Windows:

1. Find your PostgreSQL `bin` directory (e.g. `C:\Program Files\PostgreSQL\15\bin`)
2. Add that folder to your system PATH:
   - Open *System Properties* → *Environment Variables*
   - Under *System variables*, select `Path` → *Edit* → *New*
   - Paste the full path to the `bin` directory
3. Restart your terminal and start the setup.py again

⚠️⚠️⚠️

### 4. Start the Quiz

After setup, run the main quiz script:

```bash
python main.py
```

---

## 🛠️ Development

If you want to add features or improve the game, feel free to fork the repo and open a pull request.

---

## 📄 License

MIT License
