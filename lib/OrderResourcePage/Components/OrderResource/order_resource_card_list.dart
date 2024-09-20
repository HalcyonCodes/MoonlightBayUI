import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';

import '../../Util/order_service_util.dart';
import './order_resource_card.dart';
import '../../Model/ViewModel/resource_view_model.dart';
import '../../Util/order_resource_util.dart';
import '../../Model/ViewModel/resource_view_model.dart';

class OrderResourceCardList extends StatefulWidget {
  final OrderResourceUtil orderResourceUtil;
  final ResourceViewModel viewModel;
  final OrderServiceUtil orderServiceUtil;
  final ResourceViewModel resourceViewModel;
  const OrderResourceCardList(
      {super.key,
      required this.viewModel,
      required this.orderResourceUtil,
      required this.orderServiceUtil, required this.resourceViewModel});

  @override
  State<OrderResourceCardList> createState() => _OrderResourceCardListState();
}

class _OrderResourceCardListState extends State<OrderResourceCardList> {
  List<Widget> initWidgets = [];

  ListUtil? listUtil;

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
              maxPage: '99',
              pageMaxContainCount: '12',
              listUtil: listUtil!)),
    );
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadPre() async {
    await widget.viewModel.loadPre((listUtil!.getPageStartIndex!() - 1).toString());
    List<Widget> widgets = List.generate(
        widget.viewModel.orderResourceFromJsonModel!.data.orderResources!
            .length, (q) {
      return OrderResourceCard(
        util: widget.orderResourceUtil,
        orderResourceID: widget
            .viewModel.orderResourceFromJsonModel!.data.orderResources![q].id,
        bindingCount: widget.viewModel.orderResourceFromJsonModel!.data
            .orderResources![q].bindingCount,
        orderResourceName: widget
            .viewModel.orderResourceFromJsonModel!.data.orderResources![q].name,
        desc: widget
            .viewModel.orderResourceFromJsonModel!.data.orderResources![q].desc,
        orderServiceUtil: widget.orderServiceUtil,
        resourceViewModel: widget.resourceViewModel,
      );
    });
    return widgets;
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadMore() async {
    await widget.viewModel.loadMore((listUtil!.getPageEndIndex!() + 1).toString());
    List<Widget> widgets = List.generate(
        widget.viewModel.orderResourceFromJsonModel!.data.orderResources!
            .length, (q) {
      return OrderResourceCard(
        util: widget.orderResourceUtil,
        orderResourceID: widget
            .viewModel.orderResourceFromJsonModel!.data.orderResources![q].id,
        bindingCount: widget.viewModel.orderResourceFromJsonModel!.data
            .orderResources![q].bindingCount,
        orderResourceName: widget
            .viewModel.orderResourceFromJsonModel!.data.orderResources![q].name,
        desc: widget
            .viewModel.orderResourceFromJsonModel!.data.orderResources![q].desc,
        orderServiceUtil: widget.orderServiceUtil,
        resourceViewModel: widget.resourceViewModel,
      );
    });
    return widgets;
  }

  void initItem() {
    initWidgets = List.generate(
        widget.viewModel.orderResourceFromJsonModel!.data.orderResources!
            .length, (q) {
      return OrderResourceCard(
          util: widget.orderResourceUtil,
          orderResourceID: widget
              .viewModel.orderResourceFromJsonModel!.data.orderResources![q].id,
          bindingCount: widget.viewModel.orderResourceFromJsonModel!.data
              .orderResources![q].bindingCount,
          orderResourceName: widget.viewModel.orderResourceFromJsonModel!.data
              .orderResources![q].name,
          desc: widget.viewModel.orderResourceFromJsonModel!.data
              .orderResources![q].desc,
          orderServiceUtil: widget.orderServiceUtil,
          resourceViewModel: widget.resourceViewModel,
          );
    });
  }
}
