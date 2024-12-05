# README

### Phone Number Extraction Tool for Sheetwa Reports
A Rails web application to extract phone numbers from uploaded HTML or text files. The tool
processes multiple files, extracts the required information, and allows you to download the results as a CSV file.

### Features
- File Upload: Upload multiple files (HTML/TXT) simultaneously for processing. 
- Phone Number Extraction: Extracts phone numbers from the files. 
- CSV Export: Download the extracted data as a CSV file. 
- Error Handling: Displays appropriate messages for missing files, invalid data, or processing errors.

### Requirements
- Ruby: Version 2.7 or later
- Rails: Version 6.1 or later
- Dependencies:
  - nokogiri: For parsing HTML content 
  - csv: For generating CSV files (built into Ruby)

### Installation

1. Clone the Repository
    ```bash
   git clone https://github.com/your-username/phone-number-extractor.git
   cd phone-number-extractor

2. Install Dependencies
    ```bash
   bundle install

3. Start the Server
    ```bash
   rails s
Access the application at http://localhost:3000.

### Usage
1. Open the App: Navigate to http://localhost:3000 in your browser.

2. Upload Files:
- Click the "Choose Files" button and select one or more HTML or TXT files from your computer.

3. Extract Data:
- Click the "Extract Numbers" button to process the files.
- The application will extract phone numbers.

4. Download CSV:

- A CSV file containing the extracted data will be automatically downloaded or saved to your desired location.

### File Requirements
- The uploaded files should contain:
  - Phone numbers in a div[data-field="number"] tag.