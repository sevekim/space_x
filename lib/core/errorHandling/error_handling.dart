import 'parts/error_code.dart';
import 'parts/error_message.dart';

class ErrorHandling {
  //////////////////////////////////////////////
  ///Display Error Result
  //////////////////////////////////////////////
  static String getErrorMessage({
    dynamic error,
    int? manualErrorCode,
    String? formType,
  }) {
    int? statusCode;

    //Manual Error Code: No token
    if (manualErrorCode != null) {
      statusCode = manualErrorCode;

      //From Error response
    } else if (error.response != null) {
      statusCode = error.response.statusCode;
    }

    //Get the error message
    String notificationMessage = getAppropriateErrorMessage(
      statusCode: statusCode,
      formType: formType,
    );

    return notificationMessage;
  }

  //Get the appropriate error message
  static String getAppropriateErrorMessage({
    int? statusCode,
    String? formType,
  }) {
    String errorCode = ErrorCode.generalErrorCode(
      statusCode: statusCode,
      formType: formType,
    );

    //Get the error message
    String notificationMessage = ErrorMessage.displayErrorMessage(
      code: errorCode,
      formType: formType,
    );

    return notificationMessage;
  }
}
