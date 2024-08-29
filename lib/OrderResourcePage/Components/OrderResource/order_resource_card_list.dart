import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import './order_resource_card.dart';

class OrderResourceCardList extends StatefulWidget {
  const OrderResourceCardList({super.key});

  @override
  State<OrderResourceCardList> createState() => _OrderResourceCardListState();
}

class _OrderResourceCardListState extends State<OrderResourceCardList> {
  List<Widget> test = [];

  ListUtil? listUtil;

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();
    test = List.generate(12, (q) {
      return OrderResourceCard(
        bindingCount: '6',
        orderResourceID: 'RE001',
        orderResourceName: '电力',
        desc: '电力能源资源',
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
              initWidgets: test,
              initPage: '0',
              maxPage: '5',
              pageMaxContainCount: '5',
              listUtil: listUtil!)),
    );
  }
}
