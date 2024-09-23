import 'dart:math';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../Models/ViewModel/order_service_view_model.dart';
import '../../../Route/application.dart';
import '../../Components/ScriptRemove/script_remove.dart';
import '../../Components/WorkScriptEdit/script_edit.dart';
import '../../../Config/color.dart';
import '../../../Config/shadow.dart';
import '../../Util/edit_util.dart';
import '../../Util/resource_picker_util.dart';
import '../../Util/resource_util.dart';
import '../OrderServiceEdit/service_edit.dart';
import './title_page_nav.dart';
import '../../../Config/string.dart';
import 'nav_icon_button.dart';
import '../../Util/nav_util.dart';
import '../../Util/work_script_util.dart';
import '../../Util/work_script_picker_util.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';
import '../../Models/ViewModel/work_script_view_model.dart';
import '../../Models/ViewModel/work_script_picker_view_model.dart';

class PageNav extends StatefulWidget {
  final NavUtil? navUtil;
  final ResourceUtil? resourceUtil;
  final ResourcePickerUtil? resourcePickerUtil;
  final WorkScriptUtil? workScriptUtil;
  final WorkScriptPickertUtil workScriptPickertUtil;
  final EditUtil? editUtil1;
  final EditUtil? editUtil2;
  final EditUtil? editUtil3;
  final OrderServiceViewModel orderServiceViewModel;
  final OrderResourceViewModel orderResourceViewModel;
  final WorkScriptViewModel workScriptViewModel;
  final WorkScriptPickerViewModel workScriptPickerViewModel;
  


  const PageNav(
      {super.key,
      required this.editUtil1,
      required this.navUtil,
      required this.resourceUtil,
      required this.resourcePickerUtil,
      required this.workScriptUtil,
      required this.workScriptPickertUtil,
      required this.editUtil2,
      required this.editUtil3,
      required this.orderServiceViewModel, required this.orderResourceViewModel, required this.workScriptViewModel, required this.workScriptPickerViewModel,});

  @override
  State<PageNav> createState() => _PageNavState();
}

class _PageNavState extends State<PageNav> {
  double? width;
  OverlayEntry? overlayEntry;
  OverlayEntry? fOverlayEntry;
  OverlayEntry? dOverlayEntry;
  OverlayEntry? qOverlayEntry;
  int switchIndex = 0;

  @override
  void initState() {
    super.initState();
    width = 213;
    overlayEntry = ddOverlayEntry();
    fOverlayEntry = ffOverlayEntry();
    qOverlayEntry = qqOverlayEntry();
    //注册
    widget.editUtil1!.setFuncRemoveEdit(removeEdit);
    widget.editUtil1!.setFuncShowEdit(showEdit);
    widget.editUtil2!.setFuncRemoveEdit(removeEdit2);
    widget.editUtil2!.setFuncShowEdit(showEdit2);
    widget.editUtil2!.setFuncShowRemove(showDelete2);
    widget.editUtil2!.setFuncRemoveRemove(removeDelete2);
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
                NavIconButton(iconPath: 'svg/terminal.svg', onClick: () {
                  Application.router!.navigateTo(
                          context, '/TerminalPage',
                          transition: TransitionType.fadeIn);
                }),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/serviceResource.svg',
                    onClick: () {
                      Application.router!.navigateTo(
                          context, '/OrderResourcePage',
                          transition: TransitionType.fadeIn);
                    }),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/serviceResource.svg',
                    onClick: () {
                      Application.router!.navigateTo(
                          context, '/OrderServicePage',
                          transition: TransitionType.fadeIn);
                    }),
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
                      //
                      if (switchIndex == 0) {
                        widget.editUtil1!.showEdit!();
                      }
                      //脚本相关
                      if (switchIndex == 2) {
                        widget.editUtil2!.showEdit!();
                      }
                    }),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/remove.svg',
                    onClick: () {
                      //widget.editUtil!.showRemove!();
                      //
                      if (switchIndex == 0) {}
                      //脚本相关
                      if (switchIndex == 2) {
                        widget.editUtil2!.showRemove!();
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
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.rotationZ(pi),
                  child: NavIconButton(
                      iconPath: 'svg/move.svg',
                      onClick: () {
                        //widget.editUtil!.showRemove!();
                        //ServiceResource方面
                        if (switchIndex == 1) {
                          widget.resourceUtil!.addItem!(
                              widget.resourcePickerUtil!.orderResource!);
                        }
                        if (switchIndex == 2) {
                          widget.workScriptUtil!.addItem!(
                              widget.workScriptPickertUtil.workScript!);
                        }
                      }),
                ),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/move.svg',
                    onClick: () {
                      if (switchIndex == 1) {
                        widget.resourceUtil!.removeItem!();
                      }
                      if (switchIndex == 2) {
                        widget.workScriptUtil!.removeItem!();
                      }
                    }),
                SizedBox(
                  width: 12,
                ),
                //提交按钮
                NavIconButton(
                    iconPath: 'svg/add.svg',
                    onClick: () async{
                      //resource相关
                      if (switchIndex == 1) {
                        //提交的代码
                        await widget.orderResourceViewModel.commitAddResources();
                        //退出的代码
                        switchIndex = 1;
                        widget.navUtil!.switchNav!(1);
                      }
                      //script相关
                      if (switchIndex == 2) {
                        await widget.workScriptViewModel.commitAddScript();
                        //退出的代码
                        switchIndex = 2;
                        widget.navUtil!.switchNav!(2);
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
                      widget.navUtil!.setCurrentNavIndex(0);
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
                      widget.navUtil!.setCurrentNavIndex(1);
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
                      widget.navUtil!.setCurrentNavIndex(2);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  OverlayEntry ffOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(
              child: ScriptEdit(
            editUtil: widget.editUtil2, workScriptViewModel: widget.workScriptViewModel, workScriptPickerUtil: widget.workScriptPickertUtil,
          )));
    });
  }

  Future<void> showEdit2() async {
    Overlay.of(context).insert(fOverlayEntry!);
  }

  Future<void> removeEdit2() async {
    fOverlayEntry?.remove();
  }

  OverlayEntry ddOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(
              child: ServiceEdit(
            editUtil: widget.editUtil1,
            viewModel: widget.orderServiceViewModel,
          )));
    });
  }

  Future<void> showEdit() async {
    Overlay.of(context).insert(overlayEntry!);
  }

  Future<void> removeEdit() async {
    overlayEntry?.remove();
  }

  OverlayEntry qqOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(child: ScriptRemove(editUtil: widget.editUtil2!, workScriptPickerViewModel: widget.workScriptPickerViewModel, workScriptPickerUtil: widget.workScriptPickertUtil,)));
    });
  }

  Future<void> showDelete2() async {
    Overlay.of(context).insert(qOverlayEntry!);
  }

  Future<void> removeDelete2() async {
    qOverlayEntry?.remove();
  }
}
