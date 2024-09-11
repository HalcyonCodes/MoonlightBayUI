import 'package:flutter/material.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';
import './order_service_resource_list.dart';
import '../../Util/resource_util.dart';

class OrderServiceResourceListFuture extends StatefulWidget {
  final OrderResourceViewModel viewModel;
  final ResourceUtil resourceUtil;

  const OrderServiceResourceListFuture(
      {super.key, required this.viewModel, required this.resourceUtil});

  @override
  State<OrderServiceResourceListFuture> createState() =>
      _OrderServiceResourceListFutureState();
}

class _OrderServiceResourceListFutureState
    extends State<OrderServiceResourceListFuture> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            return OrderServiceResourceList(
              viewModel: widget.viewModel,
              resourceUtil: widget.resourceUtil,
            );
        }
      },
    );
  }
}
