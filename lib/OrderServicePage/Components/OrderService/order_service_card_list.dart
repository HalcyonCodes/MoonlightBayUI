import 'package:flutter/material.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import './order_service_card.dart';

class OrderServiceCardList extends StatefulWidget {
  const OrderServiceCardList({super.key});

  @override
  State<OrderServiceCardList> createState() => _OrderServiceCardListState();
}

class _OrderServiceCardListState extends State<OrderServiceCardList> {
  ListUtil? listUtil;
  List<Widget>? test;

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();
    test = List.generate(9, (q) {
      return OrderServiceCard(
        id: 'SE001',
        bindingOrderCount: '3',
        name: '开启电灯服务',
        desc: '开启电灯的服务',
        script: 'turnOnTheLight.lua',
        resources: ['电力资源', '电力', '水力', '水力资源'],
      );
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
