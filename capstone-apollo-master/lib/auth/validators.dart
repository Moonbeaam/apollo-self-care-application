class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Please enter your email.";
    }

    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Please enter your password.";
    }
    return null;
  }
}
