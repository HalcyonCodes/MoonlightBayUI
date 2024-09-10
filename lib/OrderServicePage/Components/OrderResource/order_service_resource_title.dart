import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Config/decoration.dart';

import '../../../Config/font.dart';

class OrderServiceResourceTitle extends StatelessWidget {
  final String? title;
  const OrderServiceResourceTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 529,
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 18,
                width: 18,
                child: SvgPicture.asset('Svg/serviceResource.svg')),
            const SizedBox(
              width: 4,
            ),
            Text(
              title!,
              style: KFont.channelTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
