import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qiita_kaisetsu/constraiants/app_color.dart';
import 'package:qiita_kaisetsu/constraiants/app_text.dart';
import 'package:qiita_kaisetsu/constraiants/font_family.dart';
import 'package:qiita_kaisetsu/constraiants/image_path.dart';
import 'package:qiita_kaisetsu/ui_components/button.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  AppColor.backGroundFilterColor, BlendMode.luminosity),
              image: AssetImage(ImagePath.backGround),
              fit: BoxFit.cover,
            )),
          ),
          Column(
            children: [
              Expanded(flex: 11, child: Container()),
              const Text(
                AppText.qiitaFeedApp,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.pacifico,
                  color: AppColor.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                AppText.playGround,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.25,
                  color: AppColor.white,
                ),
              ),
              Expanded(flex: 16, child: Container()),
              Button(
                onPressed: () {
                  showCupertinoModalBottomSheet(
                    enableDrag: true,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(11)),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.95,
                      );
                    },
                  );
                },
                buttonText: AppText.login,
                buttonColor: AppColor.buttonTextColor,
              ),
              const SizedBox(height: 30),
              Container(
                height: 35,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppText.withoutLogin,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.75,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 81),
            ],
          ),
        ],
      ),
    );
  }
}
