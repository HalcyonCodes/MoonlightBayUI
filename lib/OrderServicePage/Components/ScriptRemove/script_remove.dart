import 'package:flutter/material.dart';
import '../../../Config/font.dart';
import '../../../Config/shadow.dart';

import 'script_remove_commit_bar.dart';
import '../../../Config/string.dart';
import '../../Util/edit_util.dart';
import '../../Models/ViewModel/work_script_picker_view_model.dart';
import '../../Util/work_script_picker_util.dart';

class ScriptRemove extends StatefulWidget {
  final EditUtil editUtil;
  final WorkScriptPickerViewModel workScriptPickerViewModel;
  final WorkScriptPickertUtil workScriptPickerUtil;

  const ScriptRemove(
      {super.key,
      required this.editUtil,
      required this.workScriptPickerViewModel, required this.workScriptPickerUtil});

  @override
  State<ScriptRemove> createState() => _ScriptRemoveState();
}

class _ScriptRemoveState extends State<ScriptRemove> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [KShadow.shadow]),
      width: 658,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScriptRemoveCommitBar(
            editUtil: widget.editUtil,
            workScriptPickerViewModel: widget.workScriptPickerViewModel,
            workScriptPickertUtil: widget.workScriptPickerUtil,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                KString.removeTip,
                style: KFont.searchBarInputStyle,
              )),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
