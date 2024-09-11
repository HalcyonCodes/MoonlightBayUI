import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import '../../Util/resource_picker_util.dart';
import '../OrderResource/order_service_resource_card.dart';
import '../../Models/ViewModel/order_resource_picker_view_model.dart';
import '../../Util/resource_util.dart';
import 'order_service_resource_picker_card.dart';

class OrderServiceResourcePickerList extends StatefulWidget {
  final OrderResourcePickerViewModel viewModel;
  final ResourcePickerUtil resourcePickerUtil;
  final ResourceUtil resourceUtil;

  const OrderServiceResourcePickerList(
      {super.key,
      required this.viewModel,
      required this.resourceUtil,
      required this.resourcePickerUtil});

  @override
  State<OrderServiceResourcePickerList> createState() =>
      _OrderServiceResourcePickerListState();
}

class _OrderServiceResourcePickerListState
    extends State<OrderServiceResourcePickerList> {
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
      return OrderServiceResourcePickerCard(
          onTap: () {
            //设置单选
            for (var q in widget.resourcePickerUtil.setItemUnSelect!) {
              q();
            }
            widget.resourcePickerUtil.setItemSelect![q]();
            widget.resourcePickerUtil.setItemIndex(q);
            widget.resourcePickerUtil.setOrderResource(
                widget.viewModel.orderResourceFromJsonModel!.data
                    .orderResources![q].id,
                widget.viewModel.orderResourceFromJsonModel!.data
                    .orderResources![q].name,
                widget.viewModel.orderResourceFromJsonModel!.data
                    .orderResources![q].bindingCount,
                widget.viewModel.orderResourceFromJsonModel!.data
                    .orderResources![q].desc);
          },
          resourcePickerUtil: widget.resourcePickerUtil,
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
    initWidgets!.removeAt(widget.resourceUtil.itemIndex!);
    refreshUi();
  }

  refreshUi() {
    setState(() {});
  }
}
