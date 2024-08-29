import 'package:flutter/material.dart';
import '../Config/color.dart';
import '../Config/string.dart';
import './Components/Nav/page_nav.dart';
import './Components/OrderResource/order_resource.dart';
import './Components/OrderService/order_service.dart';
import './Components/Edit/edit.dart';

class OrderResourcePage extends StatefulWidget {
  const OrderResourcePage({super.key});

  @override
  State<OrderResourcePage> createState() => _OrderResourcePageState();
}

class _OrderResourcePageState extends State<OrderResourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width <= 1920 ? 1920 : 1920,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const PageNav(),
                  const SizedBox(
                    width: 24,
                  ),
                  OrderResource(),
                  SizedBox(width: 24,),
                  OrderService()
                  //Edit()

               
                  
                ],
              ),
            )),
      ),
    );
  }
}
