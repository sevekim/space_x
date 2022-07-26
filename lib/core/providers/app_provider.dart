import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:space_x/core/model/upcoming_launch_model/upcoming_launch_model.dart';
import 'package:space_x/ui/widgets/common_show_snackbar.dart';

import '../constants/api_constant.dart';
import '../constants/screen_constant.dart';
import '../constants/site_constant.dart';
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
  /// Variables
  ///
  /// **********************************************************************/

  List<dynamic> _launchCollectionMapList = [];
  Map<String, dynamic> _launchPadData = {};
  Map<String, dynamic> _rocketData = {};
  bool _isSingleLaunchDataLoaded = false;
  String _intialHomeScreenDataRetrieved = selectorScreenLoading;

  /// **********************************************************************
  ///
  /// Getter
  ///
  /// **********************************************************************/

  List<dynamic> get launchCollectionMapList => _launchCollectionMapList;
  Map<String, dynamic> get launchPadData => _launchPadData;
  Map<String, dynamic> get rocketData => _rocketData;
  bool get isSingleLaunchDataLoaded => _isSingleLaunchDataLoaded;
  String get intialHomeScreenDataRetrieved => _intialHomeScreenDataRetrieved;

  /// **********************************************************************
  ///
  /// Reset Variables
  ///
  /// **********************************************************************/

  void resetVariables() {
    _launchCollectionMapList = [];
    _launchPadData = {};
    _rocketData = {};
    _isSingleLaunchDataLoaded = false;
    _intialHomeScreenDataRetrieved = selectorScreenLoading;
  }

  void resetSingleLaunchDat() {
    _launchPadData = {};
    _rocketData = {};
    _isSingleLaunchDataLoaded = false;
  }

  /// **********************************************************************
  ///
  /// Refresh the post main screen
  ///
  /// **********************************************************************/

  Future<void> refreshPostMainScreen({
    required BuildContext context,
  }) async {
    resetVariables();
    notifyListeners();

    await getInitialData(
      context: context,
    );
  }

  /// **********************************************************************
  ///
  /// Get initial launch data
  ///
  /// **********************************************************************/

  Future<void> getInitialData({
    required BuildContext context,
  }) async {
    //Get the current date:
    int currentTimeInUnix = getCurrentTimeInUnix();

    // Getting all the 6 month upcoming launches
    await queryLaunchDateBasedOnDateDifference(
      context: context,
      httpURL: apiURL[upcomingAPI]!,
      dateQueryMap: {
        "\$gte": currentTimeInUnix,
        "\$lte": currentTimeInUnix + timeQuery
      },
    );

    // Getting all the 6 month past launches
    await queryLaunchDateBasedOnDateDifference(
      context: context,
      httpURL: apiURL[queryAPI]!,
      dateQueryMap: {
        "\$gte": currentTimeInUnix - timeQuery,
        "\$lte": currentTimeInUnix
      },
    );

    //then reorganize the data based on the unix timestamp
    _launchCollectionMapList.sort(
      (a, b) => (b['date_unix']).compareTo(
        a['date_unix'],
      ),
    );

    _intialHomeScreenDataRetrieved = selectorScreenSuccess;
    notifyListeners();
  }

  /// **********************************************************************
  ///
  /// Query Launch Data based on date difference
  ///
  /// **********************************************************************/

  Future<void> queryLaunchDateBasedOnDateDifference({
    required BuildContext context,
    required String httpURL,
    required Map<String, int> dateQueryMap,
  }) async {
    //Past data
    await getSpaceXData(
      context: context,
      httpURL: apiURL[queryAPI]!,
      httpRequestType: httpPOSTRequest,
      jsonBody: {
        "query": {
          "date_unix": dateQueryMap,
        },
        "options": {
          "pagination": false,
        }
      },
    );
  }

  /// **********************************************************************
  ///
  /// Get Single Launch Data
  ///
  /// **********************************************************************/

  int getCurrentTimeInUnix() {
    //Get the current date:
    DateTime currentTime = DateTime.now();
    int currentTimeInUnix =
        (currentTime.millisecondsSinceEpoch * 0.001).round();

    return currentTimeInUnix;
  }

  /// **********************************************************************
  ///
  /// Get Single Launch Data time range
  ///
  /// **********************************************************************/

  String getQueryTimeRangeForDisplay() {
    //Get the current date:
    int currentTimeInUnix = getCurrentTimeInUnix();

    String pastTimeLaunchMonthYear = getTimeQueryRangeInString(
      timeInUnix: currentTimeInUnix - timeQuery,
    );

    String futureLaunchMonthYear = getTimeQueryRangeInString(
      timeInUnix: currentTimeInUnix + timeQuery,
    );

    String queryTimeRange = "$pastTimeLaunchMonthYear - $futureLaunchMonthYear";

    return queryTimeRange;
  }

  /// **********************************************************************
  ///
  /// Get Single Launch Data time range
  ///
  /// **********************************************************************/

  String getTimeQueryRangeInString({
    required int timeInUnix,
  }) {
    //Get the current date:
    //Get the launch time in Unix
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      timeInUnix * 1000,
    );

    //Get the launch time in Month, Year
    String dateMonth = DateFormat('MMMM').format(DateTime(0, dateTime.month));
    String launchMonthYear = "$dateMonth, ${dateTime.year.toString()}";

    return launchMonthYear;
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
    await getSpaceXData(
      context: context,
      httpURL: "${apiURL[launchPadsAPI]!}/${singleLaunchData.launchpad!}",
      apiEndPoint: launchPadsAPI,
    );

    //Past data
    await getSpaceXData(
      context: context,
      httpURL: "${apiURL[rocketsAPI]!}/${singleLaunchData.rocket!}",
      apiEndPoint: rocketsAPI,
    );

    _isSingleLaunchDataLoaded = true;

    notifyListeners();
  }

  /// **********************************************************************
  ///
  /// Get initial launch data
  ///
  /// **********************************************************************/

  Future<void> getSpaceXData({
    required BuildContext context,
    required String httpURL,
    Map<String, dynamic>? jsonBody,
    String httpRequestType = httpGETRequest,
    String? apiEndPoint,
  }) async {
    //Update the value
    Map<String, dynamic> response = await _httpRequest.httpREQUESTWrapper(
      httpURL: httpURL,
      context: context,
      httpRequest: httpRequestType,
      jsonBody: jsonBody,
    );

    //Return type: success
    if (response[httpRETURNType] == httpRETURNSuccessType) {
      //Process the data
      await processHTTPReturnedData(
        returnedData: response[httpRETURNResponse].data,
        apiEndPoint: apiEndPoint,
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
  /// Handle fetched data
  ///
  /// **********************************************************************/

  Future<void> processHTTPReturnedData({
    required dynamic returnedData,
    String? apiEndPoint,
  }) async {
    //Update LaunchPad data
    if (apiEndPoint == launchPadsAPI) {
      _launchPadData = returnedData;

      //Update Rocket data
    } else if (apiEndPoint == rocketsAPI) {
      _rocketData = returnedData;

      //Update the Launch Data
    } else {
      _launchCollectionMapList.addAll(
        returnedData['docs'],
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
