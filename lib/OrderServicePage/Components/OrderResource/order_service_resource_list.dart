import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import '../OrderResource/order_service_resource_card.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';

class OrderServiceResourceList extends StatefulWidget {
  final ResourceViewModel viewModel;

  const OrderServiceResourceList({super.key, required this.viewModel});

  @override
  State<OrderServiceResourceList> createState() =>
      _OrderServiceResourceListState();
}

class _OrderServiceResourceListState extends State<OrderServiceResourceList> {
  ListUtil? listUtil;
  List<Widget>? initWidgets;

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();
    initWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 24 - 46,
      child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(children: initWidgets!)),
    );
  }


  void initWidget() {
    initWidgets = List.generate(
        widget.viewModel.orderResourceFromJsonModel!.data.orderResources!
            .length, (q) {
      return OrderServiceResourceCard(
          orderResourceID: widget
              .viewModel.orderResourceFromJsonModel!.data.orderResources![q].id,
          bindingCount: widget.viewModel.orderResourceFromJsonModel!.data
              .orderResources![q].bindingCount,
          orderResourceName: widget.viewModel.orderResourceFromJsonModel!.data
              .orderResources![q].name,
          desc: widget.viewModel.orderResourceFromJsonModel!.data
              .orderResources![q].desc);
    });
  }

  //移出item
  void removeWidget() {
    
  }

  //添加item
  void addWidget() {
    
  }
}
