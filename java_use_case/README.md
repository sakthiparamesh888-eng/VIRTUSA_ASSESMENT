Description

SafeLog is a password validation tool designed for an employee portal.
It checks whether a password meets security requirements and provides feedback if it fails validation.

Password Rules

The password must:

Be at least 8 characters long
Contain at least one uppercase letter
Contain at least one digit
Features
Uses a for loop to analyze characters
Uses Character.isUpperCase()
Uses Character.isDigit()
Provides specific feedback messages
Uses a while loop to repeatedly request a password until a valid one is entered
Technologies Used
Java
String manipulation
Loops
Conditional statements
 Output
Password Rules:
1. Minimum 8 characters
2. At least one uppercase letter
3. At least one digit

Enter password: hello
Too short

Enter password: helloworld
Missing uppercase letter
Missing digit

Enter password: Hello123
Password accepted