import os
import shutil
import glob

# -------------------------------
# 1️⃣ SET DIRECTORIES
# -------------------------------
source_dir = r"C:/Users/u1163734/OneDrive - IQVIA/Training/Python refresher/1_File organizer/PDF"
destination_dir = r"C:/Users/u1163734/OneDrive - IQVIA/Training/Python refresher/1_File organizer/Moved PDF_Python"

# -------------------------------
# 2️⃣ FIND ALL PDF FILES RECURSIVELY
# -------------------------------
pdf_files = glob.glob(os.path.join(source_dir, "**", "*.pdf"), recursive=True)

# -------------------------------
# 3️⃣ CREATE DESTINATION FOLDER IF MISSING
# -------------------------------
os.makedirs(destination_dir, exist_ok=True)

# -------------------------------
# 4️⃣ COPY PDF FILES
# -------------------------------
for pdf_file in pdf_files:
    shutil.copy2(pdf_file, destination_dir)

# -------------------------------
# 5️⃣ CHECK COPY SUCCESS
# -------------------------------
copied_pdfs = glob.glob(os.path.join(destination_dir, "*.pdf"))
if copied_pdfs:
    print("✅ PDF files copied successfully to the destination folder.")
else:
    print("⚠️ No PDF files found or copied.")

# -------------------------------
# 6️⃣ REMOVE HYPHENS IN FILENAMES
# -------------------------------
for file_path in copied_pdfs:
    dir_name = os.path.dirname(file_path)
    file_name = os.path.basename(file_path)
    new_file_name = file_name.replace("-", " ")
    new_file_path = os.path.join(dir_name, new_file_name)

    if new_file_path != file_path:
        os.rename(file_path, new_file_path)

print("✅ PDF files renamed successfully (hyphens removed).")

# -------------------------------
# 7️⃣ MANUAL CHECK REMINDER
# -------------------------------
print("""
🔍 FINAL CHECKS (manual steps suggested):
1. Review filenames to ensure the last word is complete.
2. Remove 'et al' from filenames if present.
3. Open PDFs to confirm filenames match article titles.
""")
