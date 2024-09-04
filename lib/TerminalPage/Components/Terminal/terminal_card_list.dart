import 'package:flutter/material.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import './terminal_card.dart';
import '../../Model/ViewModel/terminal_view_model.dart';

class TerminalCardList extends StatefulWidget {
  final TerminalViewModel viewModel;
  const TerminalCardList({super.key, required this.viewModel});

  @override
  State<TerminalCardList> createState() => _TerminalCardListState();
}

class _TerminalCardListState extends State<TerminalCardList> {
  ListUtil? listUtil;
  List<Widget>? initWidgets = [];

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();
    listUtil!.setFuncGetLoadMoreWidgets(loadMore);
    listUtil!.setFuncGetLoadPreWidgets(loadPre);
    initItem();
  }

  @override
  Widget build(BuildContext context) {
    //test
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 24 - 46,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: DoubleBladedAxe(
            initWidgets: initWidgets!,
            initPage: '0',
            maxPage: '4',
            pageMaxContainCount: '2',
            listUtil: listUtil!),
      ),
    );
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadPre() async {
    await widget.viewModel.loadPre();
    List<Widget> widgets = List.generate(widget.viewModel.terminalFromJsonModel!.data.terminals!.length, (q) {
      return TerminalCard(
        terminalID: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID,
        terminalIP: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalIP,
        terminalName: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalName,
        terminalDesc: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalDesc,
        terminalStatus: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].status,
      );
    });
    return widgets;
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadMore() async {
    await widget.viewModel.loadMore();
    List<Widget> widgets = List.generate(widget.viewModel.terminalFromJsonModel!.data.terminals!.length, (q) {
      return TerminalCard(
        terminalID: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID,
        terminalIP: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalIP,
        terminalName: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalName,
        terminalDesc: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalDesc,
        terminalStatus: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].status,
      );
    });
    return widgets;
  }

  void initItem() {
    initWidgets = List.generate(
        widget.viewModel.terminalFromJsonModel!.data.terminals!.length, (q) {
      return TerminalCard(
        terminalID: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID,
        terminalIP: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalIP,
        terminalName: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalName,
        terminalDesc: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].terminalDesc,
        terminalStatus: widget
            .viewModel.terminalFromJsonModel!.data.terminals![q].status,
      );
    });
  }
}
