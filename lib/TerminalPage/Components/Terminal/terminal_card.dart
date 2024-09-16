import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import '../../../Config/decoration.dart';
import '../../Util/terminal_util.dart';

class TerminalCard extends StatefulWidget {
  final String? terminalID;
  final String? terminalIP;
  final String? terminalName;
  final String? terminalDesc;
  final int? terminalStatus;
  final TerminalUtil? terminalUtil;
  final Function() onTap;
  final Function onPlay;
  final Function onPause;
  final Function onStop;

  const TerminalCard({
    super.key,
    required this.terminalID,
    required this.terminalIP,
    required this.terminalName,
    required this.terminalDesc,
    required this.terminalStatus,
    required this.terminalUtil,
    required this.onTap,
    required this.onPlay,
    required this.onPause,
    required this.onStop,
  });

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

    //注册
    widget.terminalUtil!.addFuncSetItemSelect(setSelect);
    widget.terminalUtil!.addFuncSetItemUnSelect(setUnSelect);
  }

  @override
  void dispose() {
    super.dispose();
    widget.terminalUtil!.removFuncSetItemSelect(setSelect);
    widget.terminalUtil!.removFuncSetItemUnSelect(setUnSelect);
  }

  void setUnSelect() {
    isSelect = false;
    refreshUi();
  }

  void setSelect() {
    isSelect = true;
    refreshUi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: isSelect == false
              ? KDecoration.cardDecoration
              : KDecoration.cardSelectedDecoration,
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
                      style: isSelect == false
                          ? KFont.cardGreyStyle
                          : KFont.cardSelectGreyStyle,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      terminalIP!,
                      style: isSelect == false
                          ? KFont.cardGreyStyle
                          : KFont.cardSelectGreyStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(terminalName!,
                    style: isSelect == false
                        ? KFont.cardNameStyle
                        : KFont.cardSelectNameStyle),
                const SizedBox(
                  height: 12,
                ),
                Text(terminalDesc!,
                    style: isSelect == false
                        ? KFont.cardGreyStyle
                        : KFont.cardSelectGreyStyle),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onLongPress: playCircleOnTap,
                      child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset(
                          'Svg/playCircle.svg',
                          color: isSelect == true
                              ? Colors.white
                              : status == 1
                                  ? KColor.primaryColor
                                  : KColor.blackColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    InkWell(
                      onLongPress: stopCircleOnTap,
                      child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset(
                          'Svg/stopCircle.svg',
                          color: isSelect == true
                              ? Colors.white
                              : status == 2
                                  ? KColor.primaryColor
                                  : KColor.blackColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    InkWell(
                      onLongPress: pauseCircleOnTap,
                      child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset(
                          'Svg/pauseCircle.svg',
                          color: isSelect == true
                              ? Colors.white
                              : status == 3
                                  ? KColor.primaryColor
                                  : KColor.blackColor,
                        ),
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

  void cardOnSelect() {
    isSelect = !isSelect!;
    refreshUi();
  }

  void playCircleOnTap() {
    status = 1;
    //添加服务器请求
    refreshUi();
    widget.onPlay();
    int a;
  }

  void stopCircleOnTap() {
    status = 2;
    //添加服务器请求
    refreshUi();
    widget.onStop();
  }

  void pauseCircleOnTap() {
    status = 3;
    //添加服务器请求
    refreshUi();
    widget.onPause();
  }
}
