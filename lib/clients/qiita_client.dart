import 'package:qiita_kaisetsu/client_information.dart';

class QiitaClient {
  static const clientId = ClientInformation.clientId;
  static const clientSecret = ClientInformation.clientSecret;

  static String displayAllowPage(String state) {
    const scope = "read_qiita%20write_qiita";
    return "https://qiita.com/api/v2/oauth/authorize?client_id=$clientId&scope=$scope&state=$state";
  }
}
