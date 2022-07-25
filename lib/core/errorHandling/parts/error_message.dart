class ErrorMessage {
  static String displayErrorMessage({
    String? code,
    String? formType,
  }) {
    String errorMessage;
    switch (code) {
      case "incorrect_login_credential":
        errorMessage = "Incorrect credential provided";
        break;

      default:
        errorMessage = "An error happened. Try again";
    }

    return errorMessage;
  }
}
