import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import 'package:moonlight_bay_ui/Config/shadow.dart';
import '../../../Route/application.dart';
import './title_page_nav.dart';
import '../../../Config/string.dart';
import 'nav_icon_button.dart';
import '../../Util/edit_util.dart';
import '../Edit/edit.dart';
import '../Remove/remove.dart';
import '../../Model/ViewModel/resource_view_model.dart';

class PageNav extends StatefulWidget {
  final EditUtil? editUtil;
  final ResourceViewModel? resourceViewModel;
  const PageNav({
    super.key,
    required this.editUtil, required this.resourceViewModel,
  });

  @override
  State<PageNav> createState() => _PageNavState();
}

class _PageNavState extends State<PageNav> {
  double? width;
  OverlayEntry? overlayEntry;
  OverlayEntry? fOverlayEntry;

  bool? isOverlay;

  @override
  void initState() {
    super.initState();
    width = 213;
    isOverlay = false;

    overlayEntry = dOverlayEntry();
    fOverlayEntry = qOverlayEntry();
    //注册
    widget.editUtil!.setFuncRemoveEdit(removeEdit);
    widget.editUtil!.setFuncShowEdit(showEdit);
    widget.editUtil!.setFuncShowRemove(showDelete);
    widget.editUtil!.setFuncRemoveRemove(removeDelete);
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
                  Application.router!.navigateTo(context, '/TerminalPage', transition: TransitionType.fadeIn);
                      
                }),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/serviceResource.svg', onClick: () {}),
                const SizedBox(
                  width: 12,
                ),
                NavIconButton(
                    iconPath: 'svg/serviceResource.svg', onClick: () {
                       Application.router!.navigateTo(context, '/OrderServicePage', transition: TransitionType.fadeIn);
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

  OverlayEntry dOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(child: Edit(editUtil: widget.editUtil!, resourceViewModel: widget.resourceViewModel!,)));
    });
  }

  Future<void> showEdit() async {
    if (isOverlay == false) {
      Overlay.of(context).insert(overlayEntry!);
      isOverlay = true;
    }
  }

  Future<void> removeEdit() async {
    if (isOverlay == true) {
      overlayEntry?.remove();
      isOverlay = false;
    }
  }

  OverlayEntry qOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: MediaQuery.of(context).size.width / 2 - 658 / 2,
          top: MediaQuery.of(context).size.height / 2 - 208 / 2,
          child: Material(child: Remove(editUtil: widget.editUtil!, resourceViewModel:  widget.resourceViewModel!,)));
    });
  }

  Future<void> showDelete() async {
    if (isOverlay == false) {
      Overlay.of(context).insert(fOverlayEntry!);
      isOverlay = true;
    }
  }

  Future<void> removeDelete() async {
    if (isOverlay == true) {
      fOverlayEntry?.remove();
      isOverlay = false;
    }
  }
}
