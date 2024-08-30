import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import 'package:moonlight_bay_ui/Config/string.dart';
import '../../../Config/decoration.dart';
import '../../../Config/font.dart';

class OrderServiceCard extends StatefulWidget {
  final String? id;
  final String? bindingOrderCount;
  final String? name;
  final String? desc;
  final List<String>? resources;
  final String? script;

  const OrderServiceCard(
      {super.key,
      required this.id,
      required this.bindingOrderCount,
      required this.name,
      required this.desc,
      required this.resources,
      required this.script});

  @override
  State<OrderServiceCard> createState() => _OrderServiceCardState();
}

class _OrderServiceCardState extends State<OrderServiceCard> {
  String? id;
  String? bindingOrderCount;
  String? name;
  String? desc;
  List<String>? resources;
  String? script;

  List<Widget>?  serviceResource;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    bindingOrderCount = widget.bindingOrderCount;
    name = widget.name;
    desc = widget.desc;
    resources = widget.resources;
    script = widget.script;

    serviceResource = List.generate(resources!.length, (q) {
      return Container(
        height: 26,
        margin: const EdgeInsets.only(right: 24, bottom: 24),
        decoration: BoxDecoration(
          color: KColor.primaryColor,
          borderRadius: BorderRadius.circular(8),

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          child: Text(resources![q], style: KFont.serviceResourceStyle),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 529,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                id!,
                style: KFont.cardGreyStyle,
              ),
              const Expanded(child: SizedBox()),
              Text(KString.orderBindingCount + bindingOrderCount!, style: KFont.cardGreyStyle),
            ]),
            const SizedBox(
              height: 24,
            ),
            Text(
              name!,
              style: KFont.cardNameStyle,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              desc!,
              style: KFont.cardGreyStyle,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24,),
            Wrap(children: serviceResource!,),
            Text('${KString.workScript} : ${script!}', style: KFont.serviceScriptStyle,)
          ],
        ),
      ),
    );
  }
}
