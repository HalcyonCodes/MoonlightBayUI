import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';

import '../OrderResource/order_service_resource_card.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';
import '../../Util/resource_util.dart';
import '../../Models/FromJsonModel/order_resource_from_json_model.dart';

class OrderServiceResourceList extends StatefulWidget {
  final OrderResourceViewModel viewModel;
  final ResourceUtil resourceUtil;

  const OrderServiceResourceList(
      {super.key, required this.viewModel, required this.resourceUtil});

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
    //initWidget();
    widget.resourceUtil.setFuncAddItem(addWidget);
    widget.resourceUtil.setFuncRemoveItem(removeWidget);
  }

  @override
  Widget build(BuildContext context) {
    initWidget();
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 24 - 46,
      child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(child: Column(children: initWidgets!))),
    );
  }

  void initWidget() {
    initWidgets = List.generate(
        widget.viewModel.orderResourceFromJsonModel!.data.orderResources!
            .length, (q) {
      return OrderServiceResourceCard(
        key: UniqueKey(),
          onTap: () {
            //设置单选
            for (var q in widget.resourceUtil.setItemUnSelect!) {
              q();
            }
            widget.resourceUtil.setItemSelect![q]();
            widget.resourceUtil.setItemIndex(q);
            
          },
          resourceUtil: widget.resourceUtil,
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
    //initWidgets!.removeAt(widget.resourceUtil.itemIndex!);
     widget .viewModel.orderResourceFromJsonModel!.data.orderResources!.removeAt(widget.resourceUtil.itemIndex!);
    refreshUi();
  }

  //添加item
  void addWidget(OrderResource orderResource) {
    widget.viewModel.orderResourceFromJsonModel!.data.orderResources!.add(orderResource);
    refreshUi();
  }

  refreshUi() {
    setState(() {});
  }
  
}
