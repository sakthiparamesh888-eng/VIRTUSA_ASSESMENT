import java.util.Scanner;

public class PasswordValidator {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        String pwd;
        boolean valid = false;

        // show password rules
        System.out.println("Password Rules:");
        System.out.println("1. Minimum 8 characters");
        System.out.println("2. At least one uppercase letter");
        System.out.println("3. At least one digit\n");

        while (!valid) {

            System.out.print("Enter password: ");
            pwd = sc.nextLine().trim();

            boolean hasUpper = false;
            boolean hasDigit = false;

            if (pwd.length() < 8) {
                System.out.println("Too short. Password must be at least 8 characters.\n");
                continue;
            }

            for (int i = 0; i < pwd.length(); i++) {

                char ch = pwd.charAt(i);

                if (Character.isUpperCase(ch)) {
                    hasUpper = true;
                }

                if (Character.isDigit(ch)) {
                    hasDigit = true;
                }
            }

            if (!hasUpper) {
                System.out.println("Missing an uppercase letter.");
            }

            if (!hasDigit) {
                System.out.println("Missing a digit.");
            }

            if (hasUpper && hasDigit) {
                valid = true;
                System.out.println("\nStrong password created successfully.");
            } else {
                System.out.println("Try again.\n");
            }
        }

        sc.close();
    }
}