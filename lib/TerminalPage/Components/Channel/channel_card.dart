import 'package:flutter/material.dart';
import '../../../Config/decoration.dart';
import '../../../Config/font.dart';

class ChannelCard extends StatefulWidget {
  final String? date;
  final String? time;
  final String? serviceName;
  final List<String>? resourceName;
  final List<String>? resourceValue;

  const ChannelCard(
      {super.key,
      required this.date,
      required this.time,
      required this.serviceName,
      required this.resourceName,
      required this.resourceValue});

  @override
  State<ChannelCard> createState() => _ChannelCardState();
}

class _ChannelCardState extends State<ChannelCard> {
  String? date;
  String? time;
  String? serviceName;
  List<String>? resourceName;
  List<String>? resourceValue;
  List<Widget> resource = [];

  @override
  void initState() {
    super.initState();
    date = widget.date;
    time = widget.time;
    serviceName = widget.serviceName;
    resourceName = widget.resourceName;
    resourceValue = widget.resourceValue;
    resource = List.generate(resourceName!.length, (q) {
      return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(resourceName![q], style: KFont.cardGreyStyle)],
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167,
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  date!,
                  style: KFont.cardGreyStyle,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  time!,
                  style: KFont.cardGreyStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(serviceName!, style: KFont.cardNameStyle),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: resource,
            )
          ],
        ),
      ),
    );
  }
}
