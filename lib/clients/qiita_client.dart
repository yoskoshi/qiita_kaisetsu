import 'package:qiita_kaisetsu/client_information.dart';

class QiitaClient {
  final clientId = ClientInformation.clientId;
  final clientSecret = ClientInformation.clientSecret;

  String displayAllowPage(String state) {
    const scope = "read_qiita%20write_qiita";
    return "https://qiita.com/api/v2/oauth/authorize?client_id=$clientId&scope=$scope&state=$state";
  }
}
