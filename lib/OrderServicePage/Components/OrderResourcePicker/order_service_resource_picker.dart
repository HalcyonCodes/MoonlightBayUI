import 'package:flutter/material.dart';
import '../../Util/resource_picker_util.dart';
import 'order_service_resource_picker_title.dart';
import '../../Models/ViewModel/order_resource_picker_view_model.dart';
import '../../Util/resource_util.dart';
import 'future_order_service_resource_picker_list.dart';

class OrderServiceResourcePicker extends StatefulWidget {
  final OrderResourcePickerViewModel? viewModel;
  final ResourcePickerUtil? resourcePickerUtil;
  final ResourceUtil resourceUtil;

  final String? title;
  const OrderServiceResourcePicker(
      {super.key,
      required this.title,
      required this.viewModel,
      required this.resourceUtil, this.resourcePickerUtil});

  @override
  State<OrderServiceResourcePicker> createState() => _OrderServiceResourcePickerState();
}

class _OrderServiceResourcePickerState extends State<OrderServiceResourcePicker> {
  String? title;

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 529,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderServiceResourcePickerTitle(
            title: title,
          ),
          const SizedBox(
            height: 24,
          ),
          OrderServiceResourcePickerListFuture(
            viewModel: widget.viewModel!,
            resourceUtil: widget.resourceUtil!,
            resourcePickerUtil: widget.resourcePickerUtil!,
          )
        ],
      ),
    );
  }
}
