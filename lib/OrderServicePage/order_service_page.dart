import 'package:flutter/material.dart';
import '../Config/color.dart';
import '../Config/string.dart';
import './Components/Nav/page_nav.dart';
import './Components/OrderService/order_service.dart';

class OrderServicePage extends StatefulWidget {
  const OrderServicePage({super.key});

  @override
  State<OrderServicePage> createState() => _OrderServicePageState();
}

class _OrderServicePageState extends State<OrderServicePage> {
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
                  OrderService()
                ],
              ),
            )),
      ),
    );
  }
}
