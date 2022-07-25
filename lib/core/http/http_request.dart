import 'package:flutter/material.dart';

import '../constants/string_constant.dart';
import 'custom_http.dart';

class HTTPRequest {
  /// **********************************************************************
  ///
  ///  Common HTTP Client
  ///
  /// **********************************************************************/

  final CustomHTTPClient _customHTTPClient = CustomHTTPClient();

  /// **********************************************************************
  ///
  ///  Common HTTP Request
  ///
  /// **********************************************************************/

  Future<dynamic> httpREQUESTWrapper({
    required BuildContext context,
    dynamic jsonBody,
    required String httpURL,
    String? formType,
    String? headerContentType,
    bool jsonContentType = true,
    String? requestType,
    bool? isScreenStatusChange,
    String? successMessage,
    bool? showNotification,
    bool? isGETRequest,
    String? parentScreenType,
    String httpRequest = httpPOSTRequest,
    String? authTokenValue,
    Map<String, dynamic>? queryMap,
  }) async {
    //Making the Custom HTTP Request
    Map<String, dynamic> response = await _customHTTPClient.httpREQUEST(
      httpURL: httpURL,
      headerContentType: headerContentType,
      jsonBody: jsonBody,
      requestType: httpRequest,
      jsonContentType: jsonContentType,
      authTokenValue: authTokenValue,
      context: context,
      queryMap: queryMap,
    );

    return response;
  }
}
