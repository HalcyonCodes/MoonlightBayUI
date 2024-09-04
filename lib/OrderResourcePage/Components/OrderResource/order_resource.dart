import 'package:flutter/material.dart';
import '../../Components/OrderResource/future_order_resource_card_list.dart';
import './order_resource_search_bar.dart';
import './order_resource_card_list.dart';
import '../../Model/ViewModel/resource_view_model.dart';
import '../../Util/order_resource_util.dart';
import '../../Util/order_service_util.dart';

class OrderResource extends StatelessWidget {
  final ResourceViewModel viewModel;
  final OrderResourceUtil orderResourceUtil;
  final OrderServiceUtil orderServiceUtil;

  const OrderResource(
      {super.key, required this.viewModel, required this.orderResourceUtil, required this.orderServiceUtil});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OrderResourceSearchBar(),
          SizedBox(
            height: 24,
          ),
          OrderResourceCardListFuture(
            viewModel: viewModel,
            orderResourceUtil: orderResourceUtil,
            orderServiceUtil: orderServiceUtil,
          )
        ],
      ),
    );
  }
}
