import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import './order_service_card.dart';

class OrderServiceCardList extends StatefulWidget {
  const OrderServiceCardList({super.key});

  @override
  State<OrderServiceCardList> createState() => _OrderServiceCardListState();
}

class _OrderServiceCardListState extends State<OrderServiceCardList> {
  ListUtil? listUtil;
  List<Widget> test = [];

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();
    test = List.generate(24, (q) {
      return  OrderServiceCard(id: q.toString(), name: '测试订单服务', desc: '测试订单服务');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 24 - 46,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child:GridView.count(
          mainAxisSpacing: 24,
          crossAxisCount: 3,
          crossAxisSpacing: 24,
          children: test,
          childAspectRatio: 371/124,
          )
      ),
    );
  }
}
