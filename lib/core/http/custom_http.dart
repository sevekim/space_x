import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../constants/site_constant.dart';
import '../constants/string_constant.dart';
import 'api_switcher.dart';
import 'http_header_options.dart';

class CustomHTTPClient {
  /// **********************************************************************
  ///
  ///  Dio Base Options
  ///
  /// **********************************************************************/

  static BaseOptions options = BaseOptions(
    connectTimeout: 15000,
    receiveTimeout: 3000,
    baseUrl: ApiSwitcher.switchAPIURL(
      apiType: currentAPIType,
    ),
  );

  Dio dio = Dio(options);

  /// **********************************************************************
  ///
  ///  HTTP Request
  ///
  /// **********************************************************************/
  Future<Map<String, dynamic>> httpREQUEST({
    String? authTokenValue,
    required BuildContext context,
    String? requestType,
    dynamic jsonBody,
    required String httpURL,
    String formType = '',
    String? headerContentType,
    bool jsonContentType = true,
    Map<String, dynamic>? queryMap,
  }) async {
    Map<String, dynamic> returnResult = {
      httpRETURNType: null,
      httpRETURNResponse: null,
    };

    //Try HTTP request
    try {
      //GET request
      if (requestType == httpGETRequest) {
        returnResult[httpRETURNResponse] = await provideGETRequest(
          dio: dio,
          url: httpURL,
          authTokenValue: authTokenValue,
          jsonContentType: jsonContentType,
          queryMap: queryMap,
        );

        //POST Request
      } else if (requestType == httpPOSTRequest) {
        returnResult[httpRETURNResponse] = await providePOSTRequest(
          dio: dio,
          url: httpURL,
          jsonBody: jsonBody,
          headerContentType: headerContentType,
          authTokenValue: authTokenValue,
          jsonContentType: jsonContentType,
        );

        //PUT Request
      } else if (requestType == httpPUTRequest) {
        returnResult[httpRETURNResponse] = await providePUTRequest(
          dio: dio,
          url: httpURL,
          jsonBody: jsonBody,
          headerContentType: headerContentType,
          authTokenValue: authTokenValue,
          jsonContentType: jsonContentType,
        );

        //Delete Request
      } else if (requestType == httpDELETERequest) {
        returnResult[httpRETURNResponse] = await provideDELETERequest(
          dio: dio,
          url: httpURL,
          authTokenValue: authTokenValue,
          jsonContentType: jsonContentType,
        );
      }
      returnResult[httpRETURNType] = httpRETURNSuccessType;

      return returnResult;
    } catch (error) {
      returnResult[httpRETURNResponse] = error;
      returnResult[httpRETURNType] = httpRETURNErrorType;

      return returnResult;
    }
  }

  /// **********************************************************************
  ///
  ///  Get Request
  ///
  /// **********************************************************************/
  Future<Response> provideGETRequest({
    required Dio dio,
    required String url,
    String? authTokenValue,
    bool jsonContentType = true,
    Map<String, dynamic>? queryMap,
  }) async {
    Map<String, dynamic> queryParametersMap = {};
    if (queryMap != null) {
      queryParametersMap = queryMap;
    }

    Response response = await dio.get(
      url,
      queryParameters: queryParametersMap,
      options: Options(
        headers: HTTPHeaderOptions.httpHeader(
          authTokenValue: authTokenValue,
          jsonContentType: jsonContentType,
        ),
      ),
    );

    return response;
  }

  /// **********************************************************************
  ///
  ///  Post request
  ///
  /// **********************************************************************/
  Future<Response> providePOSTRequest({
    required Dio dio,
    required String url,
    String? headerContentType,
    dynamic jsonBody,
    String? authTokenValue,
    bool jsonContentType = true,
  }) async {
    Response response = await dio.post(
      url,
      data: jsonBody,
      options: Options(
        contentType: headerContentType,
        headers: HTTPHeaderOptions.httpHeader(
          authTokenValue: authTokenValue,
          jsonContentType: jsonContentType,
        ),
      ),
    );

    return response;
  }

  /// **********************************************************************
  ///
  ///  Delete Request
  ///
  /// **********************************************************************/
  Future<Response> provideDELETERequest({
    required Dio dio,
    required String url,
    String? authTokenValue,
    bool jsonContentType = true,
  }) async {
    Response response = await dio.delete(
      url,
      options: Options(
        headers: HTTPHeaderOptions.httpHeader(
          authTokenValue: authTokenValue,
          jsonContentType: jsonContentType,
        ),
      ),
    );

    return response;
  }

  /// **********************************************************************
  ///
  ///  PUT Request
  ///
  /// **********************************************************************/
  Future<Response> providePUTRequest({
    required Dio dio,
    required String url,
    String? headerContentType,
    dynamic jsonBody,
    String? authTokenValue,
    bool jsonContentType = true,
  }) async {
    Response response = await dio.put(
      url,
      data: jsonBody,
      options: Options(
        contentType: headerContentType,
        headers: HTTPHeaderOptions.httpHeader(
          authTokenValue: authTokenValue,
          jsonContentType: jsonContentType,
        ),
      ),
    );

    return response;
  }
}
