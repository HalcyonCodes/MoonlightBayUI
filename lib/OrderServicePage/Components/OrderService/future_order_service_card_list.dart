




import 'package:flutter/material.dart';
import '../OrderService/future_order_service_card_list.dart';
import '../../Models/ViewModel/order_service_view_model.dart';
import './order_service_card_list.dart';
import '../../Util/service_util.dart';
import '../../Util/resource_util.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';
import '../../Util/nav_util.dart';
import '../../Models/ViewModel/work_script_view_model.dart';
import '../../Util/work_script_util.dart';

class OrderServiceCardListFuture extends StatefulWidget {
  final OrderServiceViewModel viewModel;
  final ServiceUtil serviceUtil;
  final OrderResourceViewModel orderResourceViewModel;
  final ResourceUtil resourceUtil;
  final NavUtil navUtil;
  final WorkScriptUtil workScriptUtil;
  final WorkScriptViewModel workScriptViewModel;
  const OrderServiceCardListFuture({super.key, 
  required this.viewModel, required this.serviceUtil, 
  required this.orderResourceViewModel, 
  required this.resourceUtil, required this.navUtil, required this.workScriptUtil, required this.workScriptViewModel});

  @override
  State<OrderServiceCardListFuture> createState() => _OrderServiceCardListFutureState();
}

class _OrderServiceCardListFutureState extends State<OrderServiceCardListFuture> {

  @override
  void initState() {
    super.initState();
    widget.serviceUtil.setFuncRefreshList(refreshUI);
  }
  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
        future: widget.viewModel.refresh(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('none');

            case ConnectionState.active:
              return const Text('active');

            case ConnectionState.waiting:
              return const Text('waiting');

            case ConnectionState.done:
              return OrderServiceCardList(
                
                navUtil: widget.navUtil,
                viewModel: widget.viewModel, serviceUtil: widget.serviceUtil, orderResourceViewModel: widget.orderResourceViewModel, 
                resourceUtil: widget.resourceUtil, workScriptUtil:widget.workScriptUtil, workScriptViewModel: widget.workScriptViewModel);
          }
        },
      );

  }

  void refreshUI() {
    setState(() {
    });
  }
}







