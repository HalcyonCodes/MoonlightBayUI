import 'package:flutter/material.dart';
import '../../Model/ViewModel/service_view_model.dart';
import '../../Components/OrderService/order_service_card_list.dart';
import '../../Util/order_service_util.dart';

class OrderServiceCardListFuture extends StatefulWidget {
  final OrderServiceUtil orderServiceUtil;
  final ServiceViewModel viewModel;

  const OrderServiceCardListFuture(
      {super.key, required this.viewModel, required this.orderServiceUtil});

  @override
  State<OrderServiceCardListFuture> createState() =>
      _OrderServiceCardListFutureState();
}

class _OrderServiceCardListFutureState
    extends State<OrderServiceCardListFuture> {
  @override
  void initState() {
    super.initState();
    widget.orderServiceUtil
        .setFuncLoadServiceByResourceID(loadServiceByResource);
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
              return OrderServiceCardList(
                viewModel: widget.viewModel,
              );
          }
        });
  }

  void loadServiceByResource(int resourceID) {
    widget.viewModel.setResourceID(resourceID);
    refreshUI();
  }

  void refreshUI() {
    setState(() {});
  }
}
