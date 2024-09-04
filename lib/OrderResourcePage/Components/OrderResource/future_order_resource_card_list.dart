import 'package:flutter/material.dart';
import '../../Model/ViewModel/resource_view_model.dart';
import './order_resource_card_list.dart';
import '../../Util/order_resource_util.dart';
import '../../Util/order_service_util.dart';

class OrderResourceCardListFuture extends StatefulWidget {
  final OrderServiceUtil orderServiceUtil;
  final OrderResourceUtil orderResourceUtil;

  final ResourceViewModel viewModel;

  const OrderResourceCardListFuture({super.key, required this.viewModel, required this.orderResourceUtil, required this.orderServiceUtil});

  @override
  State<OrderResourceCardListFuture> createState() =>
      _OrderResourceCardListFutureState();
}

class _OrderResourceCardListFutureState
    extends State<OrderResourceCardListFuture> {
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
              return OrderResourceCardList(
                orderServiceUtil: widget.orderServiceUtil,
                viewModel: widget.viewModel,
                orderResourceUtil: widget.orderResourceUtil,
              );
          }
        });
  }
}
