import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import '../OrderResource/order_service_resource_card.dart';

class OrderServiceResourceList extends StatefulWidget {
  const OrderServiceResourceList({super.key});

  @override
  State<OrderServiceResourceList> createState() =>
      _OrderServiceResourceListState();
}

class _OrderServiceResourceListState extends State<OrderServiceResourceList> {
  ListUtil? listUtil;
  List<Widget>? test;

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();
    test = List.generate(6, (q) {
      return OrderServiceResourceCard(
          orderResourceID: 're001',
          bindingCount: '3',
          orderResourceName: '水力',
          desc: '水力能源资源');
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
