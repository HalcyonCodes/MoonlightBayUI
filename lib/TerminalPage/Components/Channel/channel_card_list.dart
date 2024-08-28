import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import './channel_card.dart';

class ChannelCardList extends StatefulWidget {
  const ChannelCardList({super.key});

  @override
  State<ChannelCardList> createState() => _ChannelCardListState();
}

class _ChannelCardListState extends State<ChannelCardList> {
  ListUtil? listUtil;
  List<Widget> test = [];

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();

    test = List.generate(12, (q) {
       return ChannelCard(
        date: '2024/8/28', 
        time: '20:26', 
        serviceName: '开启电灯订单服务', 
        resourceName: ['资源1', '资源2'], 
        resourceValue: ['值1', '值2']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 24 - 46,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: DoubleBladedAxe(
            initWidgets: test,
            initPage: '0',
            maxPage: '5',
            pageMaxContainCount: '5',
            listUtil: listUtil!),
      ),
    );
  }
}
