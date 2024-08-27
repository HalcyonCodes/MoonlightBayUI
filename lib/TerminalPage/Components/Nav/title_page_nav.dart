import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import 'package:moonlight_bay_ui/Config/font.dart';

class NavPageTitle extends StatelessWidget {
  const NavPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 189,
      decoration: BoxDecoration(
        color: KColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 18,
            width: 18,
            child: SvgPicture.asset(
              'Svg/setting.svg',
              color: Colors.white,
              ),
          ),
          Text('管理', style: KFont.navTitleStyle,)
        ],
      ),
    );
  }
}
