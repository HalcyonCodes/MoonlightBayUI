import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import 'package:moonlight_bay_ui/Config/string.dart';
import '../../../Config/decoration.dart';
import '../../../Config/font.dart';
import '../../Util/service_util.dart';

class OrderServiceCard extends StatefulWidget {
  final String? id;
  final String? bindingOrderCount;
  final String? name;
  final String? desc;
  final List<String>? resources;
  final String? script;
  final Function() onTap;
  final ServiceUtil serviceUtil;

  const OrderServiceCard( 
      {super.key,
      required this.id,
      required this.bindingOrderCount,
      required this.name,
      required this.desc,
      required this.resources,
      required this.script,
      required this.onTap,
      required this.serviceUtil});

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

  List<Widget>? serviceResource;
  bool? isSelect;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    bindingOrderCount = widget.bindingOrderCount;
    name = widget.name;
    desc = widget.desc;
    resources = widget.resources;
    script = widget.script;
    isSelect = false;

    //注册
    widget.serviceUtil.addFuncSetItemSelect(setSelect);
    widget.serviceUtil.addFuncSetItemUnSelect(setUnSelect);
  }

  @override
  void dispose() {
    super.dispose();
    widget.serviceUtil.removFuncSetItemSelect(setSelect);
    widget.serviceUtil.removFuncSetItemUnSelect(setUnSelect);
  }

  void setUnSelect() {
    isSelect = false;
    refreshUi();
  }

  void setSelect() {
    isSelect = true;
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return 
     Container(
        width: 529,
        margin: const EdgeInsets.only(bottom: 24),
        decoration: isSelect == false ? KDecoration.cardDecoration : KDecoration.cardSelectedDecoration,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    id!,
                    style: isSelect == false
                        ? KFont.cardGreyStyle
                        : KFont.cardSelectGreyStyle,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(KString.orderBindingCount + bindingOrderCount!,
                      style: isSelect == false ? KFont.cardGreyStyle : KFont.cardSelectGreyStyle),
                ]),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  name!,
                  style: isSelect == false
                      ? KFont.cardNameStyle
                      : KFont.cardSelectNameStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  desc!,
                  style: isSelect == false
                      ? KFont.cardGreyStyle
                      : KFont.cardSelectGreyStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 24,
                ),
                Wrap(
                  children: List.generate(resources!.length, (q) {
                    return Container(
                      height: 26,
                      margin: const EdgeInsets.only(right: 24, bottom: 24),
                      decoration: BoxDecoration(
                        color: isSelect == false
                            ? KColor.primaryColor
                            : KColor.containerColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 3),
                        child: Text(resources![q],
                            style: isSelect == false
                                ? KFont.serviceResourceStyle
                                : KFont.serviceResourceSelectStyle),
                      ),
                    );
                  }),
                ),
                Text(
                  '${KString.workScript} : ${script!}',
                  style:isSelect == false ? KFont.serviceScriptStyle : KFont.cardSelectGreyStyle,
                )
              ],
            ),
          ),
        ),
      
    );
  }
}
