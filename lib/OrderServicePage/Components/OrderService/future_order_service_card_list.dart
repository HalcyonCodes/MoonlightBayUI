




import 'package:flutter/material.dart';
import '../OrderService/future_order_service_card_list.dart';
import '../../Models/ViewModel/order_service_view_model.dart';
import './order_service_card_list.dart';
import '../../Util/service_util.dart';

class OrderServiceCardListFuture extends StatefulWidget {
  final OrderServiceViewModel viewModel;
  final ServiceUtil serviceUtil;
  const OrderServiceCardListFuture({super.key, required this.viewModel, required this.serviceUtil});

  @override
  State<OrderServiceCardListFuture> createState() => _OrderServiceCardListFutureState();
}

class _OrderServiceCardListFutureState extends State<OrderServiceCardListFuture> {
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
              return OrderServiceCardList(viewModel: widget.viewModel, serviceUtil: widget.serviceUtil,);
          }
        },
      );

  }
}







