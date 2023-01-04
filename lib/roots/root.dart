import 'package:flutter/material.dart';
import 'package:qiita_kaisetsu/constraiants/app_color.dart';
import 'package:qiita_kaisetsu/constraiants/app_text.dart';
import 'package:qiita_kaisetsu/pages/feed_page.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  static final List<Widget> _pageOptions = [
    const FeedPage(),
    const Center(
      child: Text('TagPage'),
    ),
    const Center(
      child: Text('myPage'),
    ),
    const Center(
      child: Text('settingPage'),
    ),
  ];

  void onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: AppText.labelFeed,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.label_outline),
            label: AppText.labelTag,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: AppText.labelMyPage,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: AppText.labelSetting,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: AppColor.bottomNavigationBarSelectedColor,
        unselectedItemColor: AppColor.bottomNavigationBarUnSelectedColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
