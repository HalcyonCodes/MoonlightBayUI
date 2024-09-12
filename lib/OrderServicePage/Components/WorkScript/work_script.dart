import 'package:flutter/material.dart';
import '../../Components/WorkScript/future_work_script_card_list.dart';
import '../../Models/ViewModel/work_script_view_model.dart';
import '../WorkScript/work_script_card_list.dart';
import '../WorkScript/work_script_title.dart';
import '../../../Config/string.dart';
import '../../Util/work_script_util.dart';


class WorkScript extends StatefulWidget {
  final WorkScriptViewModel? viewModel;
  final WorkScriptUtil? workScriptUtil;

  const WorkScript({super.key, required this.viewModel, required this.workScriptUtil});

  @override
  State<WorkScript> createState() => _WorkScriptState();
}

class _WorkScriptState extends State<WorkScript> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 529,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkScriptTitle(title: KString.orderScript),
          const SizedBox(height: 24,),
          FutureWorkScriptCardListFuture(viewModel:widget.viewModel!, workScriptUtil: widget.workScriptUtil!,)

        ],
      ),
    );
  }
}
