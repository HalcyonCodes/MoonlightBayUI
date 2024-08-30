import 'package:flutter/material.dart';
import './order_service_card_list.dart';
import './order_service_search_bar.dart';

class OrderService extends StatelessWidget {
  const OrderService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 529,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderServiceSearchBar(),
          SizedBox(
            height: 24,
          ),
          OrderServiceCardList()
        ],
      ),
    );
  }
}
