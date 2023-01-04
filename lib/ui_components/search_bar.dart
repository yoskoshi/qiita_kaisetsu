import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qiita_kaisetsu/constraiants/app_color.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: _controller,
        //絵文字、記号を入力できないように実装
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(
              '[0-9]|[a-z]|[A-Z]|[ァ-ンヴー]|[\u3040-\u309F]|[\u4E00-\u9FFF]'))
        ],
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppColor.searchTextColor,
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 25,
          ),
          contentPadding: const EdgeInsets.only(top: 5, bottom: 8),
          filled: true,
          fillColor: AppColor.searchBarColor,
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
