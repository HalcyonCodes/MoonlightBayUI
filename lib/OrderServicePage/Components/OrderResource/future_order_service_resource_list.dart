import 'package:flutter/material.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';
import './order_service_resource_list.dart';

class OrderServiceResourceListFuture extends StatefulWidget {
  final ResourceViewModel viewModel;

  const OrderServiceResourceListFuture({super.key, required this.viewModel});

  @override
  State<OrderServiceResourceListFuture> createState() =>
      _OrderServiceResourceListFutureState();
}

class _OrderServiceResourceListFutureState
    extends State<OrderServiceResourceListFuture> {
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
            return OrderServiceResourceList(viewModel: widget.viewModel,);
        }
      },
    );
  }
}
