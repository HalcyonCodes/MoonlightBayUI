import 'package:flutter/material.dart';
import './work_script_card_list.dart';
import '../../Models/ViewModel/work_script_view_model.dart';
import '../../Util/work_script_util.dart';

class FutureWorkScriptCardListFuture extends StatefulWidget {
  final WorkScriptViewModel viewModel;
  final WorkScriptUtil workScriptUtil;
  const FutureWorkScriptCardListFuture(
      {super.key, required this.viewModel, required this.workScriptUtil});

  @override
  State<FutureWorkScriptCardListFuture> createState() =>
      _FutureWorkScriptCardListFutureState();
}

class _FutureWorkScriptCardListFutureState
    extends State<FutureWorkScriptCardListFuture> {
  @override
  void initState() {
    super.initState();
    widget.workScriptUtil.setFuncRefrshList(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            return WorkScriptCardList(
              viewModel: widget.viewModel,
              workScriptUtil: widget.workScriptUtil,
            );
        }
      },
    );
  }

  void refreshUi() {
    setState(() {});
  }
}
