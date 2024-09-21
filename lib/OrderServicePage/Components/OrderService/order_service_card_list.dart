import 'package:flutter/material.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import './order_service_card.dart';
import '../../Models/ViewModel/order_service_view_model.dart';
import '../../Util/service_util.dart';
import '../../Util/resource_util.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';
import '../../Util/nav_util.dart';
import '../../Util/work_script_util.dart';
import '../../Models/ViewModel/work_script_view_model.dart';

class OrderServiceCardList extends StatefulWidget {
  final OrderServiceViewModel viewModel;
  final ServiceUtil serviceUtil;
  final OrderResourceViewModel orderResourceViewModel;
  final ResourceUtil resourceUtil;
  final NavUtil navUtil;
  final WorkScriptUtil workScriptUtil;
  final WorkScriptViewModel workScriptViewModel;
  const OrderServiceCardList(
      {super.key,
      required this.viewModel,
      required this.serviceUtil,
      required this.orderResourceViewModel,
      required this.resourceUtil,
      required this.navUtil, required this.workScriptUtil, required this.workScriptViewModel});

  @override
  State<OrderServiceCardList> createState() => _OrderServiceCardListState();
}

class _OrderServiceCardListState extends State<OrderServiceCardList> {
  List<Widget>? initWidgets = [];
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
              initWidgets: initWidgets!,
              initPage: '0',
              maxPage: '5',
              pageMaxContainCount: '5',
              listUtil: listUtil!)),
    );
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadPre() async {
    await widget.viewModel.loadPre(
      (listUtil!.getPageStartIndex!() - 1).toString()
      );
    List<Widget> widgets = List.generate(
        widget.viewModel.fromJsonModel!.data.orderServices.length, (q) {
      return OrderServiceCard(
        serviceUtil: widget.serviceUtil,
        id: widget.viewModel.fromJsonModel!.data.orderServices[q].id,
        bindingOrderCount:
            widget.viewModel.fromJsonModel!.data.orderServices[q].bindingCount,
        name: widget.viewModel.fromJsonModel!.data.orderServices[q].name,
        desc: widget.viewModel.fromJsonModel!.data.orderServices[q].desc,
        resources:
            widget.viewModel.fromJsonModel!.data.orderServices[q].resources,
        script:
            widget.viewModel.fromJsonModel!.data.orderServices[q].workScript,
        onTap: () {
          for (var q in widget.serviceUtil.setItemUnSelect!) {
            q();
          }
          widget.serviceUtil.setItemSelect![q]();
          if (widget.navUtil.currentNavIndex == 1) {
            //print(widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.serviceUtil.setItemID(
                widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.orderResourceViewModel.setOrderServiceID(
                widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.resourceUtil.refreshList!();
          }
          if(widget.navUtil.currentNavIndex == 2){
            widget.workScriptViewModel.setOrderServiceID(
                widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.workScriptUtil.refreshList!();
          }
        },
      );
    });
    return widgets;
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadMore() async {
    await widget.viewModel.loadMore((listUtil!.getPageStartIndex!() + 1).toString());
    List<Widget> widgets = List.generate(
        widget.viewModel.fromJsonModel!.data.orderServices.length, (q) {
      return OrderServiceCard(
        serviceUtil: widget.serviceUtil,
        id: widget.viewModel.fromJsonModel!.data.orderServices[q].id,
        bindingOrderCount:
            widget.viewModel.fromJsonModel!.data.orderServices[q].bindingCount,
        name: widget.viewModel.fromJsonModel!.data.orderServices[q].name,
        desc: widget.viewModel.fromJsonModel!.data.orderServices[q].desc,
        resources:
            widget.viewModel.fromJsonModel!.data.orderServices[q].resources,
        script:
            widget.viewModel.fromJsonModel!.data.orderServices[q].workScript,
        onTap: () {
          for (var q in widget.serviceUtil.setItemUnSelect!) {
            q();
          }
          widget.serviceUtil.setItemSelect![q]();
          if (widget.navUtil.currentNavIndex == 1) {
            // print(widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.serviceUtil.setItemID(
                widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.orderResourceViewModel.setOrderServiceID(
                widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.resourceUtil.refreshList!();
          }
          if(widget.navUtil.currentNavIndex == 2){
            widget.workScriptViewModel.setOrderServiceID(
                widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.workScriptUtil.refreshList!();
          }
        },
      );
    });
    return widgets;
  }

  void initItem() {
    initWidgets = List.generate(
        widget.viewModel.fromJsonModel!.data.orderServices.length, (q) {
      return OrderServiceCard(
        serviceUtil: widget.serviceUtil,
        id: widget.viewModel.fromJsonModel!.data.orderServices[q].id,
        bindingOrderCount:
            widget.viewModel.fromJsonModel!.data.orderServices[q].bindingCount,
        name: widget.viewModel.fromJsonModel!.data.orderServices[q].name,
        desc: widget.viewModel.fromJsonModel!.data.orderServices[q].desc,
        resources:
            widget.viewModel.fromJsonModel!.data.orderServices[q].resources,
        script:
            widget.viewModel.fromJsonModel!.data.orderServices[q].workScript,
        onTap: () {
          for (var q in widget.serviceUtil.setItemUnSelect!) {
            q();
          }
          widget.serviceUtil.setItemSelect![q]();
          if (widget.navUtil.currentNavIndex == 1) {
            //print(widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.serviceUtil.setItemID(
                widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.orderResourceViewModel.setOrderServiceID(
                widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.resourceUtil.refreshList!();
          }
          if(widget.navUtil.currentNavIndex == 2){
            widget.workScriptViewModel.setOrderServiceID(
                widget.viewModel.fromJsonModel!.data.orderServices[q].id);
            widget.workScriptUtil.refreshList!();
          }
        },
      );
    });
  }
}
