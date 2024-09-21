import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import '../../../Config/string.dart';
import '../../../Config/font.dart';
import '../../Util/edit_util.dart';
import '../../Models/ViewModel/work_script_view_model.dart';
import '../../Util/work_script_picker_util.dart';

class EditCommitBar extends StatefulWidget {
  final EditUtil? editUtil;
  final WorkScriptViewModel? workScriptViewModel;
  final WorkScriptPickertUtil workScriptPickerUtil;

  const EditCommitBar({
    super.key,
    required this.editUtil,
    required this.workScriptViewModel,
    required this.workScriptPickerUtil,
  });

  @override
  State<EditCommitBar> createState() => _EditCommitBarState();
}

class _EditCommitBarState extends State<EditCommitBar> {
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
          const SizedBox(
            width: 4,
          ),
          Text(
            KString.addWorkScript,
            style: KFont.navTitleStyle,
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              widget.editUtil!.removeEdit!();
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
            onTap: () async{
              //提交的逻辑
              await widget.workScriptViewModel!.addItem(
                  widget.editUtil!.textCtrl1!.text,
                  widget.editUtil!.textCtrl2!.text);

              widget.editUtil!.removeEdit!();
              widget.workScriptPickerUtil.refreshFuture!();
            },
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
