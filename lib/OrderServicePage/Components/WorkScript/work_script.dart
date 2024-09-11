import 'package:flutter/material.dart';
import '../WorkScript/work_script_card_list.dart';
import '../WorkScript/work_script_title.dart';
import '../../../Config/string.dart';

class WorkScript extends StatefulWidget {
  const WorkScript({super.key});

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
          const WorkScriptCardList()

        ],
      ),
    );
  }
}
