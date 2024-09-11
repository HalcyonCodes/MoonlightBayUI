import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/OrderServicePage/Util/resource_util.dart';
import '../../Models/ViewModel/order_resource_picker_view_model.dart';
import '../../Util/resource_picker_util.dart';
import 'order_service_resource_picker_list.dart';

class OrderServiceResourcePickerListFuture extends StatefulWidget {
  final OrderResourcePickerViewModel viewModel;
  final ResourcePickerUtil resourcePickerUtil;
  final ResourceUtil resourceUtil;

  const OrderServiceResourcePickerListFuture(
      {super.key, required this.viewModel, required this.resourcePickerUtil, required this.resourceUtil});

  @override
  State<OrderServiceResourcePickerListFuture> createState() =>
      _OrderServiceResourcePickerListFutureState();
}

class _OrderServiceResourcePickerListFutureState
    extends State<OrderServiceResourcePickerListFuture> {
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
            return OrderServiceResourcePickerList(
              viewModel: widget.viewModel,
              resourceUtil: widget.resourceUtil,
              resourcePickerUtil: widget.resourcePickerUtil,
            );
        }
      },
    );
  }
}
