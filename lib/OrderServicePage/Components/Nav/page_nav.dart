import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import 'package:moonlight_bay_ui/Config/shadow.dart';
import 'package:moonlight_bay_ui/OrderServicePage/Util/resource_picker_util.dart';
import 'package:moonlight_bay_ui/OrderServicePage/Util/resource_util.dart';
import './title_page_nav.dart';
import '../../../Config/string.dart';
import 'nav_icon_button.dart';
import '../../Util/nav_util.dart';

class PageNav extends StatefulWidget {
  final NavUtil? navUtil;
  final ResourceUtil? resourceUtil;
  final ResourcePickerUtil? resourcePickerUtil;

  const PageNav({
    super.key,
    //required this.editUtil,
    required this.navUtil, required this.resourceUtil, required this.resourcePickerUtil,
  });

  @override
  State<PageNav> createState() => _PageNavState();
}

class _PageNavState extends State<PageNav> {
  double? width;
  OverlayEntry? overlayEntry;
  OverlayEntry? fOverlayEntry;
  int switchIndex = 0;

  @override
  void initState() {
    super.initState();
    width = 213;
    //overlayEntry = dOverlayEntry();
    //fOverlayEntry = qOverlayEntry();
    //注册
    //widget.editUtil!.setFuncRemoveEdit(removeEdit);
    //widget.editUtil!.setFuncShowEdit(showEdit);
    //widget.editUtil!.setFuncShowRemove(showDelete);
    //widget.editUtil!.setFuncRemoveRemove(removeDelete);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height <= 600
            ? 1080 - 24 - 24
            : MediaQuery.of(context).size.height - 24 - 24,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: KColor.blackColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [KShadow.shadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavPageTitle(title: KString.manage),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavIconButton(iconPath: 'svg/terminal.svg', onClick: () {}),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/serviceResource.svg', onClick: () {}),
              ],
            ),
            const SizedBox(
              height: 264,
            ),
            NavPageTitle(title: KString.toolBar),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavIconButton(
                    iconPath: 'svg/add.svg',
                    onClick: () {
                      //widget.editUtil!.showEdit!();

                    }),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/remove.svg',
                    onClick: () {
                      //widget.editUtil!.showRemove!();
                    }),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.rotationZ(pi),
                  child: NavIconButton(
                      iconPath: 'svg/move.svg',
                      onClick: () {
                        //widget.editUtil!.showRemove!();
                        //ServiceResource方面
                        if(switchIndex == 1){
                         widget.resourceUtil!.addItem!(widget.resourcePickerUtil!.orderResource!);
                        }
                      }),
                ),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/move.svg',
                    onClick: () {
                       if(switchIndex == 1){
                         int? index = widget.resourceUtil!.itemIndex;
                         widget.resourceUtil!.removeItem!();
                        }
                    }),
                SizedBox(width: 12,),
                  //提交按钮
                NavIconButton(
                    iconPath: 'svg/add.svg',
                    onClick: () {
                       if(switchIndex == 1){
                          //提交的代码
                          //退出的代码
                          switchIndex = 0;
                          widget.navUtil!.switchNav!(0);
                        }
                    }),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavIconButton(
                    iconPath: 'svg/order.svg',
                    onClick: () {
                      //widget.editUtil!.showEdit!();
                      widget.navUtil!.switchNav!(0);
                      switchIndex = 0;
                    }),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/serviceResource.svg',
                    onClick: () {
                      //widget.editUtil!.showRemove!();
                      widget.navUtil!.switchNav!(1);
                      switchIndex = 1;
                    }),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/script.svg',
                    onClick: () {
                      //widget.editUtil!.showRemove!();
                      widget.navUtil!.switchNav!(2);
                      switchIndex = 2;
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /*
  OverlayEntry dOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(child: Edit()));
    });
  }

  Future<void> showEdit() async {
    Overlay.of(context).insert(overlayEntry!);
  }

  Future<void> removeEdit() async {
    overlayEntry?.remove();
  }

  OverlayEntry qOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(child: Remove()));
    });
  }

  Future<void> showDelete() async {
    Overlay.of(context).insert(fOverlayEntry!);
  }

  Future<void> removeDelete() async {
    fOverlayEntry?.remove();
  }*/
}
