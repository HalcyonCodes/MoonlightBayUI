import 'package:flutter/material.dart';
import '../../Models/ViewModel/work_script_picker_view_model.dart';

import '../WorkScript/work_script_title.dart';
import '../../../Config/string.dart';
import '../../Util/work_script_picker_util.dart';
import './future_work_script_picker_card_list.dart';


class WorkScriptPicker extends StatefulWidget {
  final WorkScriptPickerViewModel? viewModel;
  final WorkScriptPickertUtil workScriptUtil;

  const WorkScriptPicker({super.key, required this.viewModel, required this.workScriptUtil});

  @override
  State<WorkScriptPicker> createState() => _WorkScriptPickerState();
}

class _WorkScriptPickerState extends State<WorkScriptPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 529,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkScriptTitle(title: KString.allScript),
          const SizedBox(height: 24,),
          WorkScriptPickerCardListFuture(viewModel:widget.viewModel!, workScriptUtil: widget.workScriptUtil!,)

        ],
      ),
    );
  }
}
