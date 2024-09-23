import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import 'package:moonlight_bay_ui/Config/shadow.dart';
import 'package:moonlight_bay_ui/Route/application.dart';
import 'package:moonlight_bay_ui/TerminalPage/Components/LoginEdit/login_edit.dart';

import './title_page_nav.dart';
import '../../../Config/string.dart';
import 'nav_icon_button.dart';
import '../edit/edit.dart';
import '../Remove/remove.dart';
import '../../Util/edit_util.dart';

import 'package:fluro/fluro.dart';

import '../../Model/ViewModel/terminal_view_model.dart';
import '../../Model/ViewModel/channel0_view_model.dart';
import '../../Model/ViewModel/channel1_view_model.dart';
import '../../Model/ViewModel/channel2_view_model.dart';
import '../../Model/ViewModel/channel3_view_model.dart';
import '../../Model/ViewModel/channel4_view_model.dart';
import '../../../Cookie/cookie.dart';
import '../../Util/terminal_util.dart';

class PageNav extends StatefulWidget {
  final EditUtil? editUtil;
  final TerminalViewModel terminalViewModel;
  final Channel0ViewModel channel0ViewModel;
  final Channel1ViewModel channel1ViewModel;
  final Channel2ViewModel channel2ViewModel;
  final Channel3ViewModel channel3ViewModel;
  final Channel4ViewModel channel4ViewModel;
  final TerminalUtil terminalUtil;

  const PageNav({
    super.key,
    required this.editUtil,
    required this.terminalViewModel,
    required this.channel0ViewModel,
    required this.channel1ViewModel,
    required this.channel2ViewModel,
    required this.channel3ViewModel,
    required this.channel4ViewModel, required this.terminalUtil,
  });

  @override
  State<PageNav> createState() => _PageNavState();
}

class _PageNavState extends State<PageNav> {
  double? width;
  OverlayEntry? doverlayEntry;
  OverlayEntry? fOverlayEntry;
  OverlayEntry? zOverlayEntry;
  bool? isShowEdit;
  bool? isShowRemove;

  @override
  void initState() {
    super.initState();
    width = 213;
    doverlayEntry = dOverlayEntry();
    fOverlayEntry = qOverlayEntry();
    zOverlayEntry = zzOverlayEntry();

    //注册
    widget.editUtil!.setFuncRemoveEdit(removeEdit);
    widget.editUtil!.setFuncShowEdit(showEdit);
    widget.editUtil!.setFuncShowRemove(showDelete);
    widget.editUtil!.setFuncRemoveRemove(removeDelete);
    widget.editUtil!.setFuncShowLogin(showLogin);
    widget.editUtil!.setFuncRemoveLogin(removeLogin);

    isShowEdit = false;
    isShowRemove = false;
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
            SizedBox(height: 12),
            NavIconButton(
                iconPath: 'svg/serviceResource.svg',
                onClick: () {
                  //JwtManager.test();
                  //login
                  widget.editUtil!.showLogin!();
                }),
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
                      widget.editUtil!.showEdit!();
                    }),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/remove.svg',
                    onClick: () {
                      widget.editUtil!.showRemove!();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  OverlayEntry zzOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(
              child: LoginEdit(
            editUtil: widget.editUtil,
            terminalViewModel: widget.terminalViewModel,
          )));
    });
  }

  Future<void> showLogin() async {
    if (isShowEdit == false) {
      Overlay.of(context).insert(zOverlayEntry!);
      isShowEdit = true;
    }
  }

  Future<void> removeLogin() async {
    if (isShowEdit == true) {
      zOverlayEntry?.remove();
      isShowEdit = false;
    }
  }

  OverlayEntry dOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(
              child: Edit(
            editUtil: widget.editUtil,
            terminalViewModel: widget.terminalViewModel, terminalUtil: widget.terminalUtil,
          )));
    });
  }

  Future<void> showEdit() async {
    if (isShowEdit == false) {
      Overlay.of(context).insert(doverlayEntry!);
      isShowEdit = true;
    }
  }

  Future<void> removeEdit() async {
    if (isShowEdit == true) {
      doverlayEntry?.remove();
      isShowEdit = false;
    }
  }

  OverlayEntry qOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(
              child: Remove(
            editUtil: widget.editUtil!,
            channel0ViewModel: widget.channel0ViewModel,
            channel1ViewModel: widget.channel1ViewModel,
            channel2ViewModel: widget.channel2ViewModel,
            channel3ViewModel: widget.channel3ViewModel,
            channel4ViewModel: widget.channel4ViewModel,
          )));
    });
  }

  Future<void> showDelete() async {
    if (isShowEdit == false) {
      Overlay.of(context).insert(fOverlayEntry!);
      isShowEdit = true;
    }
  }

  Future<void> removeDelete() async {
    if (isShowEdit == true) {
      fOverlayEntry?.remove();
      isShowEdit = false;
    }
  }
}
