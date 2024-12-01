const { execFile } = require('child_process');
const path = require('path');

async function parsePdfToExtractDetails(pdfPath) {
  return new Promise((resolve, reject) => {
    // Define the path to your Python script
    const scriptPath = path.resolve(__dirname, 'pdf_parse_llm.py');

    // Execute the Python script with the PDF file as an argument
    execFile('python3', [scriptPath, pdfPath], (error, stdout, stderr) => {
      if (error) {
        console.error('Error executing Python script:', stderr || error.message);
        return reject(new Error('Failed to parse PDF.'));
      }

      try {
        // Parse the JSON output from the Python script
        const result = JSON.parse(stdout);
        resolve(result);
      } catch (err) {
        console.error('Error parsing Python script output:', err.message);
        reject(new Error('Invalid output from Python script.'));
      }
    });
  });
}

module.exports = parsePdfToExtractDetails;
