import 'string_constant.dart';

//////////////////////////////////////////////
/// Base URL
//////////////////////////////////////////////

const Map<String, String> spaceXBaseURL = {
  qaURL: 'https://api.spacexdata.com/v4/',
  devURL: 'https://api.spacexdata.com/v4/',
  stageURL: 'https://api.spacexdata.com/v4/',
  prodURL: 'https://api.spacexdata.com/v4/',
};

//////////////////////////////////////////////
/// API URL
//////////////////////////////////////////////

const Map<String, String> apiURL = {
  upcomingAPI: 'launches/upcoming',
  pastAPI: 'launches/past',
  queryAPI: 'launches/query',
  rocketsAPI: 'rockets',
  launchPadsAPI: 'launchpads',
};
