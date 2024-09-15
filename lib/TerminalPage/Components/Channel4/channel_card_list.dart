import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import 'channel_card.dart';
import '../../Model/ViewModel/channel4_view_model.dart';

class ChannelCardList extends StatefulWidget {

  final Channel4ViewModel viewModel;

  const ChannelCardList({super.key, required this.viewModel});

  @override
  State<ChannelCardList> createState() => _ChannelCardListState();
}

class _ChannelCardListState extends State<ChannelCardList> {
  ListUtil? listUtil;
  List<Widget> initWidgets = [];

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
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 24 - 46,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: DoubleBladedAxe(
            initWidgets: initWidgets,
            initPage: '0',
            maxPage: '5',
            pageMaxContainCount: '5',
            listUtil: listUtil!),
      ),
    );
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadPre() async {
    await widget.viewModel.loadPre();
    List<Widget> widgets = List.generate(
        widget.viewModel.channelFromJsonModel!.data.channel.length, (q) {
      return ChannelCard(
        orderID: widget.viewModel.channelFromJsonModel!.data.channel[q].id,
          viewModel: widget.viewModel,
          date: widget.viewModel.channelFromJsonModel!.data.channel[q].date,
          time: widget.viewModel.channelFromJsonModel!.data.channel[q].time,
          serviceName: widget.viewModel.channelFromJsonModel!.data.channel[q].name,
          resourceName: List.generate(widget.viewModel.channelFromJsonModel!.data.channel[q].resource!.length, (q){
            return widget.viewModel.channelFromJsonModel!.data.channel[q].resource![q].resourceName!;
          }),
          resourceValue: List.generate(widget.viewModel.channelFromJsonModel!.data.channel[q].resource!.length, (q){
            return widget.viewModel.channelFromJsonModel!.data.channel[q].resource![q].resourceValue!;
          }),
          );
    });
    return widgets;
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadMore() async {
    await widget.viewModel.loadMore();
    List<Widget> widgets = List.generate(
        widget.viewModel.channelFromJsonModel!.data.channel.length, (q) {
      return ChannelCard(
        orderID: widget.viewModel.channelFromJsonModel!.data.channel[q].id,
          viewModel: widget.viewModel,
          date: widget.viewModel.channelFromJsonModel!.data.channel[q].date,
          time: widget.viewModel.channelFromJsonModel!.data.channel[q].time,
          serviceName: widget.viewModel.channelFromJsonModel!.data.channel[q].name,
          resourceName: List.generate(widget.viewModel.channelFromJsonModel!.data.channel[q].resource!.length, (q){
            return widget.viewModel.channelFromJsonModel!.data.channel[q].resource![q].resourceName!;
          }),
          resourceValue: List.generate(widget.viewModel.channelFromJsonModel!.data.channel[q].resource!.length, (q){
            return widget.viewModel.channelFromJsonModel!.data.channel[q].resource![q].resourceValue!;
          }),
          );
    });
    return widgets;
  }

  void initItem() {
    initWidgets = List.generate(
        widget.viewModel.channelFromJsonModel!.data.channel.length, (q) {
      return ChannelCard(
        orderID: widget.viewModel.channelFromJsonModel!.data.channel[q].id,
          viewModel: widget.viewModel,
          date: widget.viewModel.channelFromJsonModel!.data.channel[q].date,
          time: widget.viewModel.channelFromJsonModel!.data.channel[q].time,
          serviceName: widget.viewModel.channelFromJsonModel!.data.channel[q].name,
          resourceName: List.generate(widget.viewModel.channelFromJsonModel!.data.channel[q].resource!.length, (q){
            return widget.viewModel.channelFromJsonModel!.data.channel[q].resource![q].resourceName!;
          }),
          resourceValue: List.generate(widget.viewModel.channelFromJsonModel!.data.channel[q].resource!.length, (q){
            return widget.viewModel.channelFromJsonModel!.data.channel[q].resource![q].resourceValue!;
          }),
          );
    });
  }
}
