import 'package:flutter/material.dart';
import '../../../Config/decoration.dart';
import '../../../Config/font.dart';
import '../../Model/ViewModel/channel0_view_model.dart';

class ChannelCard extends StatefulWidget {
  final String? orderID;
  final String? date;
  final String? time;
  final String? serviceName;
  final List<String>? resourceName;
  final List<String>? resourceValue;
  final Channel0ViewModel viewModel;

  const ChannelCard(
      {super.key,
      required this.orderID,
      required this.date,
      required this.time,
      required this.serviceName,
      required this.resourceName,
      required this.resourceValue,
      required this.viewModel
      });

  @override
  State<ChannelCard> createState() => _ChannelCardState();
}

class _ChannelCardState extends State<ChannelCard> {
  String? orderID;
  String? date;
  String? time;
  String? serviceName;
  List<String>? resourceName;
  List<String>? resourceValue;
  //List<Widget> resource = [];
  bool? isSelect;

  @override
  void initState() {
    super.initState();
    orderID = widget.orderID;
    date = widget.date;
    time = widget.time;
    serviceName = widget.serviceName;
    resourceName = widget.resourceName;
    resourceValue = widget.resourceValue;
    isSelect = false;

    /*resource = List.generate(resourceName!.length, (q) {
      return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resourceName![q],
                    style: isSelect == false
                        ? KFont.cardGreyStyle
                        : KFont.cardSelectGreyStyle),
                const Text(" : "),
                Text(
                  resourceValue![q],
                  style: isSelect == false
                      ? KFont.cardGreyStyle
                      : KFont.cardSelectGreyStyle,
                )
              ]));
    });*/
  }

  void refreshUi() {
    setState(() {});
  }

  void onTap() {
    isSelect = !isSelect!;
    if(isSelect == true){
      widget.viewModel.addCurrentOrderID(orderID);
    }
    if(isSelect == false){
      widget.viewModel.removeCurrentOrderID(orderID);
    }
    refreshUi();
  }

  @override
  void dispose() {
    super.dispose();
    widget.viewModel.removeCurrentOrderID(orderID);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          width: 213,
          decoration: isSelect == false
              ? KDecoration.cardDecoration
              : KDecoration.cardSelectedDecoration,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 0),
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
                      style: isSelect == false
                          ? KFont.cardGreyStyle
                          : KFont.cardSelectGreyStyle,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      time!,
                      style: isSelect == false
                          ? KFont.cardGreyStyle
                          : KFont.cardSelectGreyStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(serviceName!,
                    style: isSelect == false
                        ? KFont.cardNameStyle
                        : KFont.cardSelectNameStyle),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  children: List.generate(resourceName!.length, (q) {
                    return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(resourceName![q],
                                  style: isSelect == false
                                      ? KFont.cardGreyStyle
                                      : KFont.cardSelectGreyStyle),
                              Text(" : ",
                                  style: isSelect == false
                                      ? KFont.cardGreyStyle
                                      : KFont.cardSelectGreyStyle),
                              Text(
                                resourceValue![q],
                                style: isSelect == false
                                    ? KFont.cardGreyStyle
                                    : KFont.cardSelectGreyStyle,
                              )
                            ]));
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
