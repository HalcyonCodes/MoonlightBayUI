import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import '../../../Config/decoration.dart';

class OrderServiceCard extends StatelessWidget {
  final String? id;
  final String? name;
  final String? desc;

  const OrderServiceCard(
      {super.key, required this.id, required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KDecoration.cardDecoration,
      width: 371,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              id!,
              style: KFont.cardGreyStyle,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              name!,
              style: KFont.cardNameStyle,
              overflow: TextOverflow.ellipsis ,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              desc!,
              style: KFont.cardGreyStyle,
            )
          ],
        ),
      ),
    );
  }
}
