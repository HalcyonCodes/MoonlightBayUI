import 'package:flutter/material.dart';
import './order_resource_search_bar.dart';
import './order_resource_card_list.dart';

class OrderResource extends StatelessWidget {
  const OrderResource({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OrderResourceSearchBar(),
          SizedBox(height: 24,),
          OrderResourceCardList()
        ],
      ),
    );
  }
}
