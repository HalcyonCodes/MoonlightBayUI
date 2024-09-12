import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import 'package:moonlight_bay_ui/Config/string.dart';
import '../../../Config/decoration.dart';
import '../../Util/work_script_util.dart';

class WorkScriptCard extends StatefulWidget {
  final String? id;
  final String? bindingCount;
  final String? name;
  final String? desc;
  final Function() onTap;
  final WorkScriptUtil workScriptUtil;

  const WorkScriptCard(
      {super.key,
      required this.id,
      required this.bindingCount,
      required this.name,
      required this.desc,
      required this.onTap,
      required this.workScriptUtil});

  @override
  State<WorkScriptCard> createState() => _WorkScriptCardState();
}

class _WorkScriptCardState extends State<WorkScriptCard> {
  String? id;
  String? bindingCount;
  String? name;
  String? desc;
  bool isSelect = false;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    bindingCount = widget.bindingCount;
    name = widget.name;
    desc = widget.desc;

    //注册
    widget.workScriptUtil.addFuncSetItemSelect(setSelect);
    widget.workScriptUtil.addFuncSetItemUnSelect(setUnSelect);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.workScriptUtil.removFuncSetItemSelect(setSelect);
    widget.workScriptUtil.removFuncSetItemUnSelect(setUnSelect);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: widget.onTap,
        child: Container(
          decoration: isSelect == false ? KDecoration.cardDecoration : KDecoration.cardSelectedDecoration,
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
                        id!,
                        style: isSelect == false ? KFont.cardGreyStyle : KFont.cardSelectGreyStyle,
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        KString.scriptBindingCount + bindingCount!,
                        style: isSelect == false ? KFont.cardGreyStyle : KFont.cardSelectGreyStyle,
                      )
                    ]),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  name!,
                  style: isSelect == false ? KFont.cardNameStyle : KFont.cardSelectNameStyle,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  desc!,
                  style: isSelect == false ? KFont.cardGreyStyle : KFont.cardSelectGreyStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setUnSelect() {
    setState(() {
      isSelect = false;
    });
  }

  void setSelect() {
    setState(() {
      isSelect = true;
    });
  }
}
