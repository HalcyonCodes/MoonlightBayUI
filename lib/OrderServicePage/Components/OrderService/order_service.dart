import 'package:flutter/material.dart';
import '../OrderService/future_order_service_card_list.dart';
import './order_service_card_list.dart';
import './order_service_search_bar.dart';
import '../../Models/ViewModel/order_service_view_model.dart';
import '../../Util/service_util.dart';

class OrderService extends StatelessWidget {
  final OrderServiceViewModel viewModel;
  final ServiceUtil serviceUtil;

  const OrderService({super.key, required this.viewModel, required this.serviceUtil});

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
          )
        ],
      ),
    );
  }
}
