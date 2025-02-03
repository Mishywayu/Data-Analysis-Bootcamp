-- String functions in MySQL are built-in functions that allow you to manipulate and work with string data types, 
-- such as CHAR, VARCHAR, TEXT, etc. 
-- These functions are useful for tasks like formatting, searching, extracting, and modifying text.

### 1. **Concatenation & Formatting**
(a) CONCAT(str1, str2, ...): Joins multiple strings into one.
	Example: `SELECT CONCAT('Hello', ' ', 'World');` → *Hello World*    
(b) CONCAT_WS(separator, str1, str2, ...): Joins strings with a separator.
	Example: `SELECT CONCAT_WS('-', '2024', '02', '03');` → *2024-02-03*
(c) FORMAT(number, decimal_places): Formats a number with commas and decimal places.
	Example: `SELECT FORMAT(12345.6789, 2);` → *12,345.68*

### 2. **Length & Substrings**
(a) LENGTH(str): Returns the length of a string in bytes.
	Example: `SELECT LENGTH('Data');` → *4*
(b) CHAR_LENGTH(str): Returns the number of characters in the string.
	Example: `SELECT CHAR_LENGTH('Data');` → *4*
(c) SUBSTRING(str, start, length): Extracts part of a string.
	Example: `SELECT SUBSTRING('Database', 1, 4);` → *Data*
(d) LEFT(str, length) / RIGHT(str, length): Gets characters from the start or end.
	Example: `SELECT LEFT('MySQL', 2);` → *My*

### 3. **Searching & Positioning**
(a) LOCATE(substring, string): Finds the position of a substring.
	Example: `SELECT LOCATE('a', 'Database');` → *2*
(b) INSTR(string, substring): Returns the position of the first occurrence of a substring.
	Example: `SELECT INSTR('Analytics', 'lyt');` → *3*
(c) FIND_IN_SET(str, strlist): Finds the position of a string in a comma-separated list.
	Example: `SELECT FIND_IN_SET('apple', 'banana,apple,grape');` → *2*

### 4. **Replacing & Modifying**
(a) REPLACE(str, from_str, to_str): Replaces occurrences of a substring.
	Example: `SELECT REPLACE('2023-01-01', '-', '/');` → *2023/01/01*
(b) INSERT(str, pos, len, newstr): Inserts a substring at a specific position.
	Example: `SELECT INSERT('Hello World', 6, 5, 'MySQL');` → *Hello MySQL*

### 5. **Trimming & Padding**
(a) TRIM([LEADING | TRAILING | BOTH] chars FROM str): Removes specified characters from the start/end of a string.
	Example: `SELECT TRIM('  data  ');` → *data*
(b) LTRIM(str)`** / **`RTRIM(str): Removes spaces from the left or right side.
	Example: `SELECT LTRIM('   text');` → *text*
(c) LPAD(str, length, padstr) / RPAD(str, length, padstr): Pads a string to a certain length.
	Example: `SELECT LPAD('5', 3, '0');` → *005*
    
### 6. **Case Conversion**
(a) UPPER(str) / LOWER(str): Converts strings to uppercase or lowercase.
	Example: `SELECT UPPER('mysql');` → *MYSQL*
(b) INITCAP(str) (Not in MySQL, but available in other SQL variants): Capitalizes the first letter of each word.

### 7. **Encoding & Decoding**
(a) ASCII(str): Returns the ASCII value of the first character.
	Example: `SELECT ASCII('A');` → *65*
(b) CHAR(n, ...): Converts an ASCII code to its character.
	Example: `SELECT CHAR(65);` → *A*
(c) HEX(str) / UNHEX(str): Converts a string to/from hexadecimal.
	Example: `SELECT HEX('abc');` → *616263*

### 8. **Miscellaneous**
(a) REVERSE(str): Reverses the string.
	Example: `SELECT REVERSE('Data');` → *ataD*
(b) ELT(index, str1, str2, ...): Returns the string at the given index.
	Example: `SELECT ELT(2, 'red', 'green', 'blue');` → *green*
(c) FIELD(str, str1, str2, ...): Returns the index of the string in the list.
	Example: `SELECT FIELD('green', 'red', 'green', 'blue');` → *2*

### Example Query Using Multiple String Functions:
SELECT 
    CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))) AS formatted_name,
    LENGTH(name) AS name_length,
    REPLACE(email, '@', '[at]') AS obfuscated_email
FROM users;

This query:
- Formats names with the first letter capitalized.
- Shows the length of each name.
- Obfuscates email addresses.

------------------Back to bootcamp








