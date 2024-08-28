import 'package:flutter/material.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import './terminal_card.dart';

class TerminalCardList extends StatefulWidget {
  const TerminalCardList({super.key});

  @override
  State<TerminalCardList> createState() => _TerminalCardListState();
}

class _TerminalCardListState extends State<TerminalCardList> {
  ListUtil? listUtil;
   List<Widget>? test;

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();

     //test
  test = List.generate(12, (q) {
    return TerminalCard(
      terminalID: '123',
      terminalIP: '127.0.0.1',
      terminalName: '终端名称',
      terminalDesc: '简介',
      terminalStatus: 1,
      playCircleOnTap: () {},
      stopCircleOnTap: () {},
      pauseCircleOnTap: () {},
    );
  });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 -24 -24 - 46,

      child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
        child: DoubleBladedAxe(
            initWidgets: test!,
            initPage: '0',
            maxPage: '5',
            pageMaxContainCount: '5',
            listUtil: listUtil!),
      ),
    );
  }

 
}
