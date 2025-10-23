# Moving and Renaming PDFs — R vs Python

This is a simple script comparison project to help me refresh Python syntax after years of using R.

### 🧠 What it does
- Finds all PDF files in subfolders
- Copies them into one folder
- Removes hyphens ("-") from filenames
- Prints progress messages

### 💻 Scripts
- `file_organizer.R` → R version
- `mfile_organizer.py` → Python version

### 📁 Project Structure

The folder structure expected by the scripts is:

r-to-python-pdf-mover/
├── file_organizer.R
├── file_organizer.py
├── data/
│   └── PDF/
│       ├── subfolder1/
│       │   └── (your PDF files here)
│       ├── subfolder2/
│       │   └── (your PDF files here)
│       └── ... (any number of additional subfolders with PDFs)
└── output/
    └── Moved_pdf/

> **Note:** You don’t need to include real PDF files in the repo. Create your own PDF files in `data/PDF` before running the scripts.

### 🔍 Why I made this
I've been using R regularly for data work, and while I learned Python years ago, I wanted to revisit it by translating my R scripts line-by-line into Python — a great way to understand the syntax differences more deeply.
