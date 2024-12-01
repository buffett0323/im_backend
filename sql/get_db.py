import re

def extract_database_name(file_path):
    """
    Reads an SQL file and extracts the database name from CREATE DATABASE or USE statements.
    Handles encoding errors gracefully.
    """
    encodings = ['utf-8', 'latin-1', 'iso-8859-1']  # Common encodings to try
    
    for encoding in encodings:
        try:
            with open(file_path, 'r', encoding=encoding) as file:
                sql_content = file.read()
            
            # Match CREATE DATABASE statement
            create_db_match = re.search(r'CREATE DATABASE\s+(\w+)', sql_content, re.IGNORECASE)
            if create_db_match:
                return create_db_match.group(1)
            
            # Match USE statement
            use_db_match = re.search(r'USE\s+(\w+)', sql_content, re.IGNORECASE)
            if use_db_match:
                return use_db_match.group(1)
            
            return "Database name not found in the SQL file."
        
        except UnicodeDecodeError:
            continue  # Try the next encoding
    
    return "Could not decode the file with common encodings."

# Example usage
file_path = "DB.sql"  # Replace with the actual file path
database_name = extract_database_name(file_path)
print(f"Database name: {database_name}")
