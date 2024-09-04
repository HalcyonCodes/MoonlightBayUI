import 'package:flutter/material.dart';
import '../OrderService/future_order_service_card_list.dart';
import '../OrderService/order_service_card_list.dart';
import '../OrderService/order_service_title.dart';
import '../OrderResource/order_resource_card_list.dart';
import '../../Model/ViewModel/service_view_model.dart';
import '../../Util/order_service_util.dart';

class OrderService extends StatefulWidget {
  final OrderServiceUtil orderServiceUtil;

  final ServiceViewModel viewModel;

  const OrderService({super.key, required this.viewModel, required this.orderServiceUtil});

  @override
  State<OrderService> createState() => _OrderServiceState();
}

class _OrderServiceState extends State<OrderService> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1161,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderServiceTitle(),
          SizedBox(
            height: 24,
          ),
          OrderServiceCardListFuture(
            viewModel: widget.viewModel, orderServiceUtil: widget.orderServiceUtil,
          )
        ],
      ),
    );
  }
}
