# Clear global environment
rm(list=ls())

################################CODES START#####################################

######COPY AND PASTE PDFS FROM INDIVIDUAL ENDNOTE SUBFOLDERS TO ONE FILDER######

# Set the source directory where the subfolders with PDF files are located
source_dir <- "C:/Users/u1163734/OneDrive - IQVIA/General - Amgen PH HTA 1/08. HTA dossier development - new format/Amgen Prolia Traveling Library.Data/PDF"

# Set the destination directory to copy the PDF files
destination_dir <- "C:/Users/u1163734/OneDrive - IQVIA/General - Amgen PH HTA 1/08. HTA dossier development - new format/Moved pdf"

# List all PDF files in subfolders
pdf_files <- list.files(path = source_dir, pattern = ".pdf$", recursive = TRUE, 
                        full.names = TRUE)

# Create the destination directory if it doesn't exist
if (!file.exists(destination_dir)) {
  dir.create(destination_dir)
}

# Copy PDF files to the destination directory
file.copy(pdf_files, destination_dir, overwrite = TRUE)

# Check if the files were copied successfully
if (length(list.files(destination_dir, pattern = ".pdf$", 
                      full.names = TRUE)) > 0) {
  cat("PDF files copied successfully to the destination folder.\n")
} else {
  cat("No PDF files found or copied.\n")
}


#################################SORT FILE NAMES################################

######################REMOVE HYPHEN (-) FROM FILE NAMES#########################

# Function to remove hyphens from file names
remove_hyphens <- function(file_path) {
  file_dir <- dirname(file_path)
  file_name <- basename(file_path)
  new_file_name <- gsub("-", " ", file_name)
  new_file_path <- file.path(file_dir, new_file_name)
  file.rename(file_path, new_file_path)
}

# List all PDF files in the folder and subfolders
pdf_files <- list.files(path = destination_dir, pattern = ".pdf$", 
                        recursive = TRUE, full.names = TRUE)

# Rename PDF files to remove hyphens
for (pdf_file in pdf_files) {
  remove_hyphens(pdf_file)
}

# Check if the files were renamed successfully
if (all(file.exists(pdf_files))) {
  cat("PDF files renamed successfully.\n")
} else {
  cat("File renaming failed for some PDF files.\n")
}

##########################FINAL FILE NAME CHECKS################################
# 1. Eyeballing file names to check whether the last word is complete;
#    if not open the file and check and complete/remove the last word.
# 2. Eyeballing file names to look for "et al" and remove them.
# 3. Open the pdfs to check whether the file names match the article titles;
#    if not then search and download the article.

##############################END OF CODES######################################
