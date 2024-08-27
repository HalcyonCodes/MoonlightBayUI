import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import 'package:moonlight_bay_ui/Config/shadow.dart';

class PageNav extends StatefulWidget {
  const PageNav({
    super.key,
  });

  @override
  State<PageNav> createState() => _PageNavState();
}

class _PageNavState extends State<PageNav> {
  double? height;
  double? width;

  @override
  void initState() {
    super.initState();
    height = MediaQuery.sizeOf(context).height - 24 - 24;
    width = 213;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: KColor.blackColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [KShadow.shadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
        ],
      ),
    );
  }
}
