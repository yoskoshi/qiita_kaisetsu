import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qiita_kaisetsu/client_information.dart';

class QiitaClient {
  static const clientId = ClientInformation.clientId;
  static const clientSecret = ClientInformation.clientSecret;

  static String displayAllowPage(String state) {
    const scope = "read_qiita%20write_qiita";
    return "https://qiita.com/api/v2/oauth/authorize?client_id=$clientId&scope=$scope&state=$state";
  }

  static Future<String> issueAccessToken(Uri uri, String expectedState) async {
    final String? code = uri.queryParameters["code"];
    final String? state = uri.queryParameters["state"];
    if (state != expectedState) {
      throw Exception("state is different from expectedState");
    }

    final response = await http.post(
      Uri.parse("https://qiita.com/api/v2/access_tokens"),
      headers: {
        "content-type": "application/json",
      },
      body: jsonEncode(
        {
          "client_id": clientId,
          "client_secret": clientSecret,
          "code": code,
        },
      ),
    );

    if (response.statusCode == 201) {
      final body = json.decode(response.body);
      final accessToken = body["token"];
      return accessToken;
    } else {
      throw Exception("accessToken couldn't issue");
    }
  }
}
