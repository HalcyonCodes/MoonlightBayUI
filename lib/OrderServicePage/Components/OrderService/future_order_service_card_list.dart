




import 'package:flutter/material.dart';
import '../OrderService/future_order_service_card_list.dart';
import '../../Models/ViewModel/order_service_view_model.dart';
import './order_service_card_list.dart';

class OrderServiceCardListFuture extends StatefulWidget {
  final OrderServiceViewModel viewModel;
  const OrderServiceCardListFuture({super.key, required this.viewModel});

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
              return Text('none');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.done:
              return OrderServiceCardList(viewModel: widget.viewModel,);
          }
        },
      );

  }
}







