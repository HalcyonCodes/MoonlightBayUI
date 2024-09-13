import 'package:flutter/material.dart';
import './order_service_resource_title.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';
import '../../Util/resource_util.dart';
import './future_order_service_resource_list.dart';
import '../../Util/service_util.dart';

class OrderServiceResource extends StatefulWidget {
  final OrderResourceViewModel? viewModel;

  final ResourceUtil? resourceUtil;


  final String? title;
  const OrderServiceResource(
      {super.key,
      required this.title,
      required this.viewModel,
      required this.resourceUtil,
      });

  @override
  State<OrderServiceResource> createState() => _OrderServiceResourceState();
}

class _OrderServiceResourceState extends State<OrderServiceResource> {
  String? title;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    int a;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 529,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderServiceResourceTitle(
            title: title,
          ),
          const SizedBox(
            height: 24,
          ),
          OrderServiceResourceListFuture(
            viewModel: widget.viewModel!,
            resourceUtil: widget.resourceUtil!,

          )
        ],
      ),
    );
  }
}
