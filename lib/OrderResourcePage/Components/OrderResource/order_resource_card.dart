import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import 'package:moonlight_bay_ui/Config/string.dart';
import '../../../Config/decoration.dart';

class OrderResourceCard extends StatefulWidget {
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
  State<OrderResourceCard> createState() => _OrderResourceCardState();
}

class _OrderResourceCardState extends State<OrderResourceCard> {
  String? orderResourceID;
  String? bindingCount;
  String? orderResourceName;
  String? desc;

  bool? isSelect;

  @override
  void initState() {
    super.initState();
    orderResourceID = widget.orderResourceID;
    bindingCount = widget.bindingCount;
    orderResourceName = widget.orderResourceName;
    desc = widget.desc;
    isSelect = false;
  }

  void cardOnTap() {
    isSelect = !isSelect!;
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: cardOnTap,
        child: Container(
          decoration: isSelect == false
              ? KDecoration.cardDecoration
              : KDecoration.cardSelectedDecoration,
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
                        style: isSelect == false
                            ? KFont.cardGreyStyle
                            : KFont.cardSelectGreyStyle,
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        '${KString.bindingCount} : ${bindingCount!}',
                        style: isSelect == false
                            ? KFont.cardGreyStyle
                            : KFont.cardSelectGreyStyle,
                      )
                    ]),
                const SizedBox(
                  height: 24,
                ),
                Text(orderResourceName!,
                    style: isSelect == false
                        ? KFont.cardNameStyle
                        : KFont.cardSelectNameStyle),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  desc!,
                  style: isSelect == false
                      ? KFont.cardGreyStyle
                      : KFont.cardSelectGreyStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
