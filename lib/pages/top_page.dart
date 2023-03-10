import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qiita_kaisetsu/constraiants/app_color.dart';
import 'package:qiita_kaisetsu/constraiants/app_text.dart';
import 'package:qiita_kaisetsu/constraiants/font_family.dart';
import 'package:qiita_kaisetsu/constraiants/image_path.dart';
import 'package:qiita_kaisetsu/pages/login_page.dart';
import 'package:qiita_kaisetsu/providers/loading_notifier.dart';
import 'package:qiita_kaisetsu/roots/root.dart';
import 'package:qiita_kaisetsu/ui_components/button.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingProvider);
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
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.95,
                        child: const LoginPage(),
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
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Root()));
                  },
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
          if (loading)
            Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColor.dividerColor,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
