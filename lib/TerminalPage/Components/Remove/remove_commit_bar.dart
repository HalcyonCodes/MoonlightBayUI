import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import '../../../Config/decoration.dart';
import '../../../Config/string.dart';
import '../../../Config/font.dart';
import '../../Util/edit_util.dart';

class RemoveCommitBar extends StatefulWidget {
  final EditUtil? editUtil;
  const RemoveCommitBar({super.key, required this.editUtil});

  @override
  State<RemoveCommitBar> createState() => _RemoveCommitBarState();
}

class _RemoveCommitBarState extends State<RemoveCommitBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 658,
      decoration: BoxDecoration(
          color: KColor.primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            height: 18,
            width: 18,
            child: SvgPicture.asset(
              'Svg/add.svg',
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            KString.removeTargetTitle,
            style: KFont.navTitleStyle,
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              widget.editUtil!.removeRemove!();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: KColor.navIconColor),
              width: 74,
              child: Text(KString.cancel, style: KFont.editTitleStyle),
            ),
          ),
          InkWell(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            onTap: () {widget.editUtil!.removeRemove!();},
            child: Container(
              decoration: BoxDecoration(
                  color: KColor.primaryColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              alignment: Alignment.center,
              width: 74,
              child: Text(KString.commit, style: KFont.editTitleStyle),
            ),
          ),
        ],
      ),
    );
  }
}
