import 'package:flutter/material.dart';
import '../OrderService/future_order_service_card_list.dart';
import './order_service_card_list.dart';
import './order_service_search_bar.dart';
import '../../Models/ViewModel/order_service_view_model.dart';

class OrderService extends StatelessWidget {
  final OrderServiceViewModel viewModel;

  const OrderService({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 529,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderServiceSearchBar(),
          SizedBox(
            height: 24,
          ),
          OrderServiceCardListFuture(
            viewModel: viewModel,
          )
        ],
      ),
    );
  }
}
