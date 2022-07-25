import 'package:dio/dio.dart';

////////////////////////////////////////////////////////////////////////////////////////
/// URL
////////////////////////////////////////////////////////////////////////////////////////

const String baseURL = "baseURL";
const String upcomingAPI = "upcomingAPI";
const String pastAPI = "pastAPI";
const String rocketsAPI = "rocketsAPI";
const String launchPadsAPI = "launchPadsAPI";

////////////////////////////////////////////////////////////////////////////////////////
/// URL
////////////////////////////////////////////////////////////////////////////////////////

const String qaURL = "qaURL";
const String devURL = "devURL";
const String stageURL = "stageURL";
const String prodURL = "prodURL";
const String devURLText = "devURL";
const String stageURLText = "stageURL";
const String prodURLText = "prodURL";
const String qaURLText = "qaURLText";

////////////////////////////////////////////////////////////////////////////////////////
/// HTTP Request
////////////////////////////////////////////////////////////////////////////////////////

//Different HTTP request: GET or POST
const String httpGETRequest = 'httpGETRequest';
const String httpPOSTRequest = 'httpPOStRequest';
const String httpDELETERequest = 'httpDELETERequest';
const String httpPUTRequest = 'httpPUTRequest';

//Different MAP key: httpRETURNType or httpRETURNResponse
const String httpRETURNType = 'httpRETURNType';
const String httpRETURNResponse = 'httpRETURNResponse';

//Differenciate the return type: either success or error
const String httpRETURNSuccessType = 'httpRETURNSuccessType';
const String httpRETURNErrorType = 'httpRETURNErrorType';

//////////////////////////////////////////////
///HTTP Post Header Option
//////////////////////////////////////////////

const String headerURLEncoded = Headers.formUrlEncodedContentType;
const String urlEncodedContentTypeText = 'application/x-www-form-urlencoded';
const String jsonContentTypeText = 'application/json';
const String headerContentType = 'Content-Type';
const String headerAccept = 'Accept';
const String headerAuthorization = 'Authorization';

//////////////////////////////////////////////
/// Error constants
//////////////////////////////////////////////

const String error = 'error';
const String noNetwork = 'noNetwork';
const String generalError = 'noNgeneralErroretwork';

//////////////////////////////////////////////
/// Color constants
//////////////////////////////////////////////

const String mainBlue = 'mainBlue';
const String defaultGrey = 'defaultGrey';
