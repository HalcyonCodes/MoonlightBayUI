import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/OrderResourcePage/Components/OrderService/order_service_card_list.dart';
import '../OrderService/order_service_title.dart';
import '../OrderResource/order_resource_card_list.dart';

class OrderService extends StatefulWidget {
  const OrderService({super.key});

  @override
  State<OrderService> createState() => _OrderServiceState();
}

class _OrderServiceState extends State<OrderService> {


  
  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1161,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderServiceTitle(),
          SizedBox(height: 24,),
          OrderServiceCardList()
          
        ],
      ),
    );
  }
}
