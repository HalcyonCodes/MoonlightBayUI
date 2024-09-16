import 'package:flutter/material.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import './terminal_card.dart';
import '../../Model/ViewModel/terminal_view_model.dart';
import '../../Util/terminal_util.dart';
import '../../Model/ViewModel/channel0_view_model.dart';
import '../../Model/ViewModel/channel1_view_model.dart';
import '../../Model/ViewModel/channel2_view_model.dart';
import '../../Model/ViewModel/channel3_view_model.dart';
import '../../Model/ViewModel/channel4_view_model.dart';
import '../../Util/channel_util.dart';

class TerminalCardList extends StatefulWidget {
  final TerminalViewModel viewModel;
  final TerminalUtil terminalUtil;
  final Channel0ViewModel channel0ViewModel;
  final Channel1ViewModel channel1ViewModel;
  final Channel2ViewModel channel2ViewModel;
  final Channel3ViewModel channel3ViewModel;
  final Channel4ViewModel channel4ViewModel;
  final ChannelUtil channelUtil;

  const TerminalCardList(
      {super.key,
      required this.viewModel,
      required this.terminalUtil,
      required this.channel0ViewModel,
      required this.channel1ViewModel,
      required this.channel2ViewModel,
      required this.channel3ViewModel,
      required this.channel4ViewModel,
      required this.channelUtil});

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
    List<Widget> widgets = List.generate(
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
        terminalStatus:
            widget.viewModel.terminalFromJsonModel!.data.terminals![q].status,
        onTap: () {
          for (var q in widget.terminalUtil.setItemUnSelect!) {
            q();
          }
          widget.terminalUtil.setItemSelect![q]();
          widget.channel0ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel1ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel2ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel3ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel4ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
        },
        terminalUtil: widget.terminalUtil,
        onPlay: ()  {
          //这里有bug，点击之后不会刷新频道
          widget.viewModel.setTerminalStatus(1);
        },
        onPause: () {
          widget.viewModel.setTerminalStatus(2);
        },
        onStop: () {
          widget.viewModel.setTerminalStatus(3);
        },
      );
    });
    return widgets;
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadMore() async {
    await widget.viewModel.loadMore();
    List<Widget> widgets = List.generate(
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
        terminalStatus:
            widget.viewModel.terminalFromJsonModel!.data.terminals![q].status,
        onTap: () {
          for (var q in widget.terminalUtil.setItemUnSelect!) {
            q();
          }
          widget.channel0ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel1ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel2ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel3ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel4ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.terminalUtil.setItemSelect![q]();
          for (var q in widget.channelUtil.refreshChannels!) {
            q();
          }
        },
        terminalUtil: widget.terminalUtil,
        onPlay: () {
          widget.viewModel.setTerminalStatus(1);
        },
        onPause: () {
          widget.viewModel.setTerminalStatus(2);
        },
        onStop: () {
           widget.viewModel.setTerminalStatus(3);
        },
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
        terminalStatus:
            widget.viewModel.terminalFromJsonModel!.data.terminals![q].status,
        onTap: () {
          for (var q in widget.terminalUtil.setItemUnSelect!) {
            q();
          }
          widget.terminalUtil.setItemSelect![q]();
          widget.channel0ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel1ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel2ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel3ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          widget.channel4ViewModel.setCurrentTerminalID(widget
              .viewModel.terminalFromJsonModel!.data.terminals![q].terminalID);
          for (var q in widget.channelUtil.refreshChannels!) {
            q();
          }
        },
        terminalUtil: widget.terminalUtil,
        onPlay: ()  {
          widget.viewModel.setTerminalStatus(1);
        },
        onPause: () {
          widget.viewModel.setTerminalStatus(2);
        },
        onStop: () {
          widget.viewModel.setTerminalStatus(3);
        },
      );
    });
  }
}
