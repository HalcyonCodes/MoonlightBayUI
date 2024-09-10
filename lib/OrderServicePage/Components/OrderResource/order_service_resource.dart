import 'package:flutter/material.dart';
import './order_service_resource_list.dart';
import './order_service_resource_title.dart';
import '../../Models/ViewModel/order_resource_view_model.dart';

class OrderServiceResource extends StatefulWidget {
  final ResourceViewModel? viewModel;

  final String? title;
  const OrderServiceResource({super.key, required this.title, required this.viewModel});

  @override
  State<OrderServiceResource> createState() => _OrderServiceResourceState();
}

class _OrderServiceResourceState extends State<OrderServiceResource> {
  String? title;

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 529,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderServiceResourceTitle(title: title,),
          SizedBox(
            height: 24,
          ),
          OrderServiceResourceList(viewModel: widget.viewModel!,)
        ],
      ),
    );
  }
}
