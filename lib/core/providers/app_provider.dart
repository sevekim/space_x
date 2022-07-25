import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';
import 'package:space_x/ui/widgets/common_show_snackbar.dart';

import '../constants/api_constant.dart';
import '../constants/screen_constant.dart';
import '../constants/string_constant.dart';
import '../http/http_request.dart';

class AppProvider with ChangeNotifier {
  /// **********************************************************************
  ///
  /// Custom HTTP Request
  ///
  /// **********************************************************************/

  final HTTPRequest _httpRequest = HTTPRequest();

  /// **********************************************************************
  ///
  ///  Children Provider
  ///
  /// **********************************************************************/

  /// **********************************************************************
  ///
  /// Variables
  ///
  /// **********************************************************************/

  List<dynamic> _upcomingLaunchData = [];
  Map<String, dynamic> _launchPadData = {};
  Map<String, dynamic> _rocketData = {};
  bool _isSingleLaunchDataLoaded = false;

  /// **********************************************************************
  ///
  /// Getter
  ///
  /// **********************************************************************/

  List<dynamic> get upcomingLaunchData => _upcomingLaunchData;
  Map<String, dynamic> get launchPadData => _launchPadData;
  Map<String, dynamic> get rocketData => _rocketData;
  bool get isSingleLaunchDataLoaded => _isSingleLaunchDataLoaded;

  /// **********************************************************************
  ///
  /// Setter
  ///
  /// **********************************************************************/

  /// **********************************************************************
  ///
  /// Reset Variables
  ///
  /// **********************************************************************/

  void resetVariables() {
    _upcomingLaunchData = [];
    _launchPadData = {};
    _rocketData = {};
  }

  void resetSingleLaunchDat() {
    _launchPadData = {};
    _rocketData = {};
    _isSingleLaunchDataLoaded = false;
  }

  /// **********************************************************************
  ///
  /// Get initial launch data
  ///
  /// **********************************************************************/

  Future<void> getInitialData({
    required BuildContext context,
  }) async {
    //Upcoming data
    await getInitialLaunchData(
      context: context,
      httpURL: apiURL[upcomingAPI]!,
    );

    //Past data
    await getInitialLaunchData(
      context: context,
      httpURL: apiURL[pastAPI]!,
    );
  }

  /// **********************************************************************
  ///
  /// Get Single Launch Data
  ///
  /// **********************************************************************/

  Future<void> getSingleLaunchData({
    required BuildContext context,
    required UpcomingLaunchData singleLaunchData,
  }) async {
    //Upcoming data
    await getLaunchPadData(
      context: context,
      httpURL: "${apiURL[launchPadsAPI]!}/${singleLaunchData.launchpad!}",
    );

    //Past data
    await getRocketData(
      context: context,
      httpURL: "${apiURL[rocketsAPI]!}/${singleLaunchData.rocket!}",
    );

    _isSingleLaunchDataLoaded = true;

    notifyListeners();
  }

  /// **********************************************************************
  ///
  /// Get initial launch data
  ///
  /// **********************************************************************/

  Future<void> getInitialLaunchData({
    required BuildContext context,
    required String httpURL,
    Map<String, dynamic>? jsonBody,
  }) async {
    //Update the value
    Map<String, dynamic> response = await _httpRequest.httpREQUESTWrapper(
      httpURL: httpURL,
      context: context,
      httpRequest: httpGETRequest,
      jsonBody: jsonBody,
    );

    //Return type: success
    if (response[httpRETURNType] == httpRETURNSuccessType) {
      _upcomingLaunchData.addAll(
        response[httpRETURNResponse].data,
      );

      //Return type: error
    } else if (response[httpRETURNType] == httpRETURNErrorType) {
      errorResult(
        context: context,
        error: response[httpRETURNResponse],
      );
    }
  }

  /// **********************************************************************
  ///
  /// Get initial launch data
  ///
  /// **********************************************************************/

  Future<void> getLaunchPadData({
    required BuildContext context,
    required String httpURL,
    Map<String, dynamic>? jsonBody,
  }) async {
    //Update the value
    Map<String, dynamic> response = await _httpRequest.httpREQUESTWrapper(
      httpURL: httpURL,
      context: context,
      httpRequest: httpGETRequest,
      jsonBody: jsonBody,
    );

    //Return type: success
    if (response[httpRETURNType] == httpRETURNSuccessType) {
      _launchPadData = response[httpRETURNResponse].data;

      //Return type: error
    } else if (response[httpRETURNType] == httpRETURNErrorType) {
      errorResult(
        context: context,
        error: response[httpRETURNResponse],
      );
    }
  }

  /// **********************************************************************
  ///
  /// Get initial launch data
  ///
  /// **********************************************************************/

  Future<void> getRocketData({
    required BuildContext context,
    required String httpURL,
    Map<String, dynamic>? jsonBody,
  }) async {
    //Update the value
    Map<String, dynamic> response = await _httpRequest.httpREQUESTWrapper(
      httpURL: httpURL,
      context: context,
      httpRequest: httpGETRequest,
      jsonBody: jsonBody,
    );

    //Return type: success
    if (response[httpRETURNType] == httpRETURNSuccessType) {
      _rocketData = response[httpRETURNResponse].data;

      //Return type: error
    } else if (response[httpRETURNType] == httpRETURNErrorType) {
      errorResult(
        context: context,
        error: response[httpRETURNResponse],
      );
    }
  }

  /// **********************************************************************
  ///
  /// Show error modal
  ///
  /// **********************************************************************/

  void errorResult({
    required DioError error,
    required BuildContext context,
  }) {
    String message = modalMessage[generalError];

    ShowSnackBar.displaySnackBar(
      context: context,
      message: message,
    );
  }
}
