import 'package:flutter/material.dart';
import '../OrderService/future_order_service_card_list.dart';
import './order_service_card_list.dart';
import './order_service_search_bar.dart';
import '../../Models/ViewModel/order_service_view_model.dart';
import '../../Util/service_util.dart';
import '../../Util/resource_util.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';
import '../../Util/nav_util.dart';
import '../../Util/work_script_util.dart';
import '../../Models/ViewModel/work_script_view_model.dart';

class OrderService extends StatelessWidget {
  final OrderServiceViewModel viewModel;
  final ServiceUtil serviceUtil;
  final OrderResourceViewModel resourceViewModel;
  final ResourceUtil resourceUtil;
  final NavUtil navUtil;
  final WorkScriptUtil workScriptUtil;
  final WorkScriptViewModel workScriptViewModel;

  const OrderService({super.key, 
  required this.navUtil,
  required this.viewModel, required this.serviceUtil, 
  required this.resourceViewModel, required this.resourceUtil,
   required this.workScriptUtil, required this.workScriptViewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 529,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderServiceSearchBar(),
          const SizedBox(
            height: 24,
          ),
          OrderServiceCardListFuture(
            viewModel: viewModel,
            serviceUtil: serviceUtil, 
            orderResourceViewModel: resourceViewModel, 
            resourceUtil: resourceUtil, navUtil: navUtil, workScriptUtil: workScriptUtil, workScriptViewModel: workScriptViewModel,
          )
        ],
      ),
    );
  }
}
