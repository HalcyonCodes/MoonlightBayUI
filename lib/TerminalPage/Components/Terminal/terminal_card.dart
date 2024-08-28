import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import '../../../Config/decoration.dart';


class TerminalCard extends StatefulWidget {
  final String? terminalID;
  final String? terminalIP;
  final String? terminalName;
  final String? terminalDesc;
  final int? terminalStatus;
  final Function()? playCircleOnTap;
  final Function()? stopCircleOnTap;
  final Function()? pauseCircleOnTap;

  const TerminalCard(
      {super.key,
      required this.terminalID,
      required this.terminalIP,
      required this.terminalName,
      required this.terminalDesc,
      required this.terminalStatus,
      required this.playCircleOnTap,
      required this.stopCircleOnTap,
      required this.pauseCircleOnTap});

  @override
  State<TerminalCard> createState() => _TerminalCardState();
}

class _TerminalCardState extends State<TerminalCard> {
  String? terminalID;
  String? terminalIP;
  String? terminalName;
  String? terminalDesc;
  int? status;

  bool? isSelect;

  @override
  void initState() {
    super.initState();
    terminalID = widget.terminalID;
    terminalIP = widget.terminalIP;
    terminalName = widget.terminalName;
    terminalDesc = widget.terminalDesc;
    status = widget.terminalStatus;
    isSelect = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom:  24),
      child: InkWell(
        onTap: cardOnSelect,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: KDecoration.cardDecoration,
          
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      terminalID!,
                      style: KFont.cardGreyStyle,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      terminalIP!,
                      style: KFont.cardGreyStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(terminalName!, style: KFont.cardNameStyle),
                const SizedBox(
                  height: 12,
                ),
                Text(terminalDesc!, style: KFont.cardGreyStyle),
                const SizedBox(
                  height: 24,
                ),
                 Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onLongPress: widget.playCircleOnTap,
            child: SizedBox(
              height: 26,
              width: 26,
              child: SvgPicture.asset('Svg/playCircle.svg', color: status == 1?KColor.primaryColor:KColor.blackColor,),
            ),
          ),
          const SizedBox(width: 24,),
          InkWell(
            onLongPress: widget.stopCircleOnTap,
            child: SizedBox(
              height: 26,
              width: 26,
              child: SvgPicture.asset('Svg/stopCircle.svg', color: status == 2?KColor.primaryColor:KColor.blackColor,),
            ),
          ),
          const SizedBox(width: 24,),
          InkWell(
            onLongPress: widget.pauseCircleOnTap,
            child: SizedBox(
              height: 26,
              width: 26,
              child: SvgPicture.asset('Svg/pauseCircle.svg', color: status == 3?KColor.primaryColor:KColor.blackColor,),
            ),
          ),
        ],
      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void refreshUi() {
    setState(() {});
  }

  void cardOnSelect() {}
  void initSelectStatus() {
    isSelect = false;

  }
}
