import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/OrderServicePage/Components/WorkScript/work_script_card.dart';

class WorkScriptCardList extends StatefulWidget {
  const WorkScriptCardList({super.key});

  @override
  State<WorkScriptCardList> createState() => _WorkScriptCardListState();
}

class _WorkScriptCardListState extends State<WorkScriptCardList> {
  ListUtil? listUtil;
  List<Widget>? test;

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();
    test = List.generate(12, (q) {
      return const WorkScriptCard(
          id: 'sr001',
          bindingCount: '3',
          name: 'turnOnTheLight.lua',
          desc: '打开电灯');
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 24 - 46,
      child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: DoubleBladedAxe(
              initWidgets: test!,
              initPage: '0',
              maxPage: '5',
              pageMaxContainCount: '5',
              listUtil: listUtil!)),
    );
  }
}
