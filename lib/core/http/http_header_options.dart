import '../constants/string_constant.dart';

class HTTPHeaderOptions {
  static Map<String, String> httpHeader({
    String? authTokenValue,
    bool jsonContentType = true,
  }) {
    String contentType;

    if (jsonContentType == true) {
      contentType = jsonContentTypeText;
    } else {
      contentType = urlEncodedContentTypeText;
    }

    return {
      headerContentType: contentType,
      headerAccept: jsonContentTypeText,
      headerAuthorization: 'Bearer $authTokenValue',
    };
  }
}
