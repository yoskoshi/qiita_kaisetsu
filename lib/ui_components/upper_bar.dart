import 'package:flutter/material.dart';
import 'package:qiita_kaisetsu/constraiants/app_color.dart';
import 'package:qiita_kaisetsu/ui_components/search_bar.dart';

class UpperBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarText;
  final Widget? leading;
  final String fontFamilyText;
  final FontWeight? fontWeight;
  final bool? showSearchBar;
  const UpperBar(
      {Key? key,
      required this.appBarText,
      this.leading,
      required this.fontFamilyText,
      this.fontWeight,
      this.showSearchBar = false})
      : super(key: key);

  @override
  Size get preferredSize => showSearchBar!
      ? const Size(double.infinity, 96)
      : const Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.white,
      elevation: 0,
      leading: leading,
      title: Text(
        appBarText,
        style: TextStyle(
          fontSize: 17,
          fontFamily: fontFamilyText,
          fontWeight: fontWeight,
          color: AppColor.black,
        ),
      ),
      bottom: showSearchBar!
          ? PreferredSize(
              preferredSize: const Size.fromHeight(46),
              child: Column(
                children: [
                  SearchBar(),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 0.5,
                    height: 0,
                    color: AppColor.dividerColor,
                  ),
                ],
              ))
          : const PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Divider(
                thickness: 0.5,
                height: 0,
                color: AppColor.dividerColor,
              ),
            ),
    );
  }
}
