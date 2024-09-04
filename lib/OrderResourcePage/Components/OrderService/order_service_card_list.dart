import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import './order_service_card.dart';
import '../../Model/ViewModel/service_view_model.dart';

class OrderServiceCardList extends StatefulWidget {
  final ServiceViewModel viewModel;
  const OrderServiceCardList({super.key, required this.viewModel});

  @override
  State<OrderServiceCardList> createState() => _OrderServiceCardListState();
}

class _OrderServiceCardListState extends State<OrderServiceCardList> {
  ListUtil? listUtil;
  List<Widget> initWidgets = [];

  @override
  void initState() {
    super.initState();
    initItem();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 24 - 46,
      child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: GridView.count(
            mainAxisSpacing: 24,
            crossAxisCount: 3,
            crossAxisSpacing: 24,
            childAspectRatio: 371 / 124,
            children: initWidgets,
          )),
    );
  }



  void initItem() {
    initWidgets = List.generate(
        widget.viewModel.orderResourceFromJsonModel!.data.orderServices!.length,
        (q) {
      return OrderServiceCard(
          id: widget
              .viewModel.orderResourceFromJsonModel!.data.orderServices![q].id,
          name: widget.viewModel.orderResourceFromJsonModel!.data
              .orderServices![q].name,
          desc: widget.viewModel.orderResourceFromJsonModel!.data
              .orderServices![q].desc);
    });
  }
}
