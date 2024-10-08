import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlight_bay_ui/Config/color.dart';

import '../../../Config/decoration.dart';
import '../../../Config/string.dart';
import '../../../Config/font.dart';
import '../../Util/edit_util.dart';
import '../../Model/ViewModel/resource_view_model.dart';
import '../../Util/order_resource_util.dart';

class EditCommitBar extends StatefulWidget {
   final ResourceViewModel resourceViewModel;
  final EditUtil editUtil;
  final OrderResourceUtil orderResourceUtil;

  const EditCommitBar({super.key, required this.editUtil, required this.resourceViewModel, required this.orderResourceUtil, });

  @override
  State<EditCommitBar> createState() => _EditCommitBarState();
}

class _EditCommitBarState extends State<EditCommitBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 658,
      decoration: BoxDecoration(
          color: KColor.primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            height: 18,
            width: 18,
            child: SvgPicture.asset(
              'Svg/add.svg',
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            KString.addOrderResource,
            style: KFont.navTitleStyle,
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              widget.editUtil.removeEdit!();
              },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: KColor.navIconColor),
              width: 74,
              child: Text(KString.cancel, style: KFont.editTitleStyle),
            ),
          ),
          InkWell(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            onTap: ()async {
              //加入提交的逻辑
              await widget.resourceViewModel.addItem(widget.editUtil.textEditingController1!.text, widget.editUtil.textEditingController2!.text);
              widget.editUtil.removeEdit!();
              widget.orderResourceUtil.refreshList!();
              },
            child: Container(
              decoration: BoxDecoration(
                  color: KColor.primaryColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              alignment: Alignment.center,
              width: 74,
              child: Text(KString.commit, style: KFont.editTitleStyle),
            ),
          ),
        ],
      ),
    );
  }
}
