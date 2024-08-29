import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import 'package:moonlight_bay_ui/Config/string.dart';
import '../../../Config/decoration.dart';

class OrderResourceCard extends StatelessWidget {
  final String? orderResourceID;
  final String? bindingCount;
  final String? orderResourceName;
  final String? desc;

  const OrderResourceCard(
      {super.key,
      required this.orderResourceID,
      required this.bindingCount,
      required this.orderResourceName,
      required this.desc});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: (){},
        child: Container(
          decoration: KDecoration.cardDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        orderResourceID!,
                        style: KFont.cardGreyStyle,
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        '${KString.bindingCount} : ${bindingCount!}',
                        style: KFont.cardGreyStyle,
                      )
                    ]),
                const SizedBox(
                  height: 24,
                ),
                Text(orderResourceName!, style: KFont.cardNameStyle),
                const SizedBox(
                  height: 12,
                ),
                Text(desc!, style: KFont.cardGreyStyle,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
