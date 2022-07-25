class ErrorCode {
  //General Error
  static String generalErrorCode({
    int? statusCode,
    String? formType,
  }) {
    //Show options based on StatusCode
    String errorCode;

    //Bad Request handle
    if (statusCode == 401) {
      //Correct email, wrong password
      errorCode = 'incorrect_login_credential';

      //Unauthrorized
    } else if (statusCode == 403) {
      errorCode = 'not_authorized';

      //Request not found error
    } else if (statusCode == 404) {
      errorCode = 'not_found';

      //Request not found error
    } else if (statusCode == 409) {
      errorCode = 'duplicated_value';

      //Unprocessable entity error
    } else if (statusCode == 422) {
      errorCode = 'unprocessable_entity';

      //Gateway Timeout
    } else if (statusCode == 504) {
      errorCode = 'gateway_timeout';

      //Bad Gateway
    } else if (statusCode == 502) {
      errorCode = 'bad_gateway';

      //No Token
    } else if (statusCode == 555) {
      errorCode = 'no_token';

      //Password recovery server error
    } else if (statusCode == 556) {
      errorCode = 'password_recovery_error';

      //Sign up server error
    } else if (statusCode == 557) {
      errorCode = 'sign_up_error';

      //Sign up server error
    } else if (statusCode == 558) {
      errorCode = 'no_data_given';

      //Sign up server error
    } else if (statusCode == 400) {
      errorCode = 'email_not_verified';

      //Anything else
    } else {
      errorCode = 'unknown_issue';
    }

    return errorCode;
  }
}
