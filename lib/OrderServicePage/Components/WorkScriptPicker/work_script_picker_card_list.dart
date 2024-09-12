import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import './work_script_picker_card.dart';
import '../../Models/ViewModel/work_script_picker_view_model.dart';

import '../../Util/work_script_picker_util.dart';

class WorkScriptPickerCardList extends StatefulWidget {
  final WorkScriptPickerViewModel viewModel;
  final WorkScriptPickertUtil workScriptUtil;
  const WorkScriptPickerCardList(
      {super.key, required this.viewModel, required this.workScriptUtil});

  @override
  State<WorkScriptPickerCardList> createState() =>
      _WorkScriptPickerCardListState();
}

class _WorkScriptPickerCardListState extends State<WorkScriptPickerCardList> {
  ListUtil? listUtil;
  List<Widget>? initWidgets;

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();
    initWidgets = [];

    //注册
    //widget.workScriptUtil.setFuncAddItem(addWidget);
    widget.workScriptUtil.setFuncRemoveItem(removeWidget);
  }

  @override
  Widget build(BuildContext context) {
    initWidget();
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 24 - 46,
      child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: initWidgets!,
            ),
          )),
    );
  }

  void initWidget() {
    initWidgets = List.generate(
        widget.viewModel.fromJsonModel!.data!.workScripts!.length, (q) {
      return WorkScriptPickerCard(
        key: UniqueKey(),
        id: widget.viewModel.fromJsonModel!.data!.workScripts![q].id,
        bindingCount:
            widget.viewModel.fromJsonModel!.data!.workScripts![q].bindingCount,
        name: widget.viewModel.fromJsonModel!.data!.workScripts![q].name,
        desc: widget.viewModel.fromJsonModel!.data!.workScripts![q].desc,
        onTap: () {
          for (var q in widget.workScriptUtil.setItemUnSelect!) {
            q();
          }
          widget.workScriptUtil.setItemSelect![q]();
          widget.workScriptUtil.setItemIndex(q);
          widget.workScriptUtil.setWorkScript(
            widget.viewModel.fromJsonModel!.data!.workScripts![q].id,
            widget.viewModel.fromJsonModel!.data!.workScripts![q].name,
            widget.viewModel.fromJsonModel!.data!.workScripts![q].desc,
            widget.viewModel.fromJsonModel!.data!.workScripts![q].bindingCount,
          );
        },
        workScriptUtil: widget.workScriptUtil,
      );
    });
  }

  //移出item
  void removeWidget() {
    widget.viewModel.fromJsonModel!.data!.workScripts!
        .removeAt(widget.workScriptUtil.itemIndex!);
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }
}
