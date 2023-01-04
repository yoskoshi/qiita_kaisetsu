import 'package:flutter/material.dart';
import 'package:qiita_kaisetsu/constraiants/app_text.dart';
import 'package:qiita_kaisetsu/ui_components/upper_bar.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        appBar: UpperBar(
          appBarText: AppText.appBarFeed,
          fontFamilyText: AppText.pacifico,
          fontWeight: FontWeight.w400,
          showSearchBar: true,
        ),
      ),
    );
  }
}
