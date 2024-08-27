import 'package:flutter/material.dart';
import './color.dart';
import './shadow.dart';

class KDecoration {


  //卡片容器
  static BoxDecoration cardDecoration = BoxDecoration(
    color: KColor.containerColor,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [KShadow.shadow],
  );

  //卡片选中时的容器
  static BoxDecoration cardSelectedDecoration = BoxDecoration(
    color: KColor.primaryColor,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [KShadow.shadow],
  );

}
