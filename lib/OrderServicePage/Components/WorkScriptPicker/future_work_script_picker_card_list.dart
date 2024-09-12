

import 'package:flutter/material.dart';
import 'work_script_picker_card_list.dart';
import '../../Models/ViewModel/work_script_picker_view_model.dart';
import '../../Util/work_script_util.dart';
import '../../Util/work_script_picker_util.dart';

class WorkScriptPickerCardListFuture extends StatefulWidget {
  
  final WorkScriptPickerViewModel viewModel;
  final WorkScriptPickertUtil workScriptUtil;

  const WorkScriptPickerCardListFuture({super.key, required this.viewModel, required this.workScriptUtil});


  @override
  State<WorkScriptPickerCardListFuture> createState() => _WorkScriptPickerCardListFutureState();
}

class _WorkScriptPickerCardListFutureState extends State<WorkScriptPickerCardListFuture> {
 
  @override
  Widget build(BuildContext context) {
    return   FutureBuilder(
      future: widget.viewModel.refresh(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('none');

          case ConnectionState.active:
            return const Text('active');

          case ConnectionState.waiting:
            return const Text('waiting');

          case ConnectionState.done:
            return WorkScriptPickerCardList(
              viewModel: widget.viewModel, workScriptUtil: widget.workScriptUtil,);
        }
      },
    );
  }
}