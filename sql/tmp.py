import pandas as pd

# Read the CSV file
file_path = "theme.csv"  # Path to your CSV file
df = pd.read_csv(file_path)

# Clean up any issues with quotation marks and special characters
# Ensuring that the 'definition' column text is cleaned up for CSV import
df['definition'] = df['definition'].apply(lambda x: x.replace('"', '""') if isinstance(x, str) else x)

# Ensure there are no empty fields or misalignments in the columns
df = df.dropna(how='any')  # This removes rows with any missing values

# Add id column if it's missing or incorrect
df.insert(0, 'id', range(1, len(df) + 1))

# Write the cleaned CSV back
output_path = "theme.csv"  # Path for cleaned file
df.to_csv(output_path, index=False)

print(f"Cleaned CSV file has been saved as: {output_path}")
