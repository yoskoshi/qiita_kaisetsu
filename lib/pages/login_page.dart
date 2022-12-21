import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qiita_kaisetsu/clients/qiita_client.dart';
import 'package:qiita_kaisetsu/constraiants/app_color.dart';
import 'package:qiita_kaisetsu/constraiants/app_text.dart';
import 'package:qiita_kaisetsu/constraiants/font_family.dart';
import 'package:qiita_kaisetsu/pages/feed_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final String state;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    state = _randomString(40);
    final WebViewController controller = WebViewController();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) async {
        if (request.url
            .startsWith("https://qiita.com/settings/applications?code")) {
          Uri uri = Uri.parse(request.url);
          await certification(uri);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }))
      ..loadRequest(Uri.parse(QiitaClient.displayAllowPage(state)));
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.modalAppColor,
        elevation: 0,
        title: const Text(
          AppText.qiitaAuth,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.pacifico,
            color: AppColor.black,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(
            height: 0,
            thickness: 0.5,
            color: AppColor.dividerColor,
          ),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }

  String _randomString(int length) {
    const char = "abcdefghijklmnopqrstuvwxyz0123456789";
    final rand = Random.secure();
    final codeUnits = List.generate(length, (index) {
      final n = rand.nextInt(char.length);
      return char.codeUnitAt(n);
    });
    return String.fromCharCodes(codeUnits);
  }

  Future<void> certification(Uri uri) async {
    final accessToken = await QiitaClient.issueAccessToken(uri, state);
    QiitaClient.saveAccessToken(accessToken);

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const FeedPage()));
  }
}
