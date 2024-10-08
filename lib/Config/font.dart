import 'package:flutter/material.dart';
import './color.dart';

class KFont {
  //nav 标题头的字体
  static TextStyle navTitleStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    decoration: TextDecoration.none,
    //height:
  );

  //searchBar 标题字体
  static TextStyle searchBarTitleStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    decoration: TextDecoration.none,
    //height:
  );

  //searchBar 提示字体
  static TextStyle searchBarTipStyle = TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: KColor.greyTextColor,
    decoration: TextDecoration.none,
    //height:
  );

  //searchBar 输入字体
  static TextStyle searchBarInputStyle = TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: KColor.blackColor,
    decoration: TextDecoration.none,
  );

  //card 灰色字体
  static TextStyle cardGreyStyle = TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: KColor.greyTextColor,
    decoration: TextDecoration.none,
  );

  //card 选中时灰色字体
  static TextStyle cardSelectGreyStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    decoration: TextDecoration.none,
  );

  //card 主题字体
  static TextStyle cardNameStyle = TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: KColor.blackColor,
    decoration: TextDecoration.none,
  );

  //card 选中时 主题字体
  static TextStyle cardSelectNameStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    decoration: TextDecoration.none,
  );

  //channelTitle 标题字体
  static TextStyle channelTitleStyle = TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: KColor.blackColor,
    decoration: TextDecoration.none,
  );

  //edit 标题字体
  static TextStyle editTitleStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    decoration: TextDecoration.none,
  );

  //order Service 徽章字体
    static TextStyle serviceResourceStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    decoration: TextDecoration.none,
    height: 16/11
  );  

  //order Service 徽章被选中字体
  static TextStyle serviceResourceSelectStyle = TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: KColor.primaryColor,
    decoration: TextDecoration.none,
    height: 16/11
  );  

  //orderService 脚本字体
    static TextStyle serviceScriptStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    decoration: TextDecoration.none,
  );
}
