import '../constants/api_constant.dart';
import '../constants/string_constant.dart';

class ApiSwitcher {
  static String switchAPIURL({
    String apiType = devURLText,
  }) {
    String selectedURL = '';

    switch (apiType) {
      case qaURLText:
        selectedURL = spaceXBaseURL[qaURL]!;
        break;
      case devURLText:
        selectedURL = spaceXBaseURL[devURL]!;
        break;
      case stageURLText:
        selectedURL = spaceXBaseURL[stageURL]!;
        break;
      case prodURLText:
        selectedURL = spaceXBaseURL[prodURL]!;
        break;
    }

    return selectedURL;
  }
}
