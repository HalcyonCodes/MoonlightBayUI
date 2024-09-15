import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlight_bay_ui/Config/color.dart';
import '../../../Config/decoration.dart';
import '../../../Config/string.dart';
import '../../../Config/font.dart';
import '../../Util/edit_util.dart';
import '../../Model/ViewModel/channel0_view_model.dart';
import '../../Model/ViewModel/channel1_view_model.dart';
import '../../Model/ViewModel/channel2_view_model.dart';
import '../../Model/ViewModel/channel3_view_model.dart';
import '../../Model/ViewModel/channel4_view_model.dart';
import '../../Util/channel_util.dart';

class RemoveCommitBar extends StatefulWidget {
  final EditUtil? editUtil;
  final Channel0ViewModel? channel0ViewModel;
  final Channel1ViewModel? channel1ViewModel;
  final Channel2ViewModel? channel2ViewModel;
  final Channel3ViewModel? channel3ViewModel;
  final Channel4ViewModel? channel4ViewModel;
  final ChannelUtil? channelUtil;
  const RemoveCommitBar(
      {super.key,
      required this.editUtil,
      required this.channel0ViewModel,
      required this.channel1ViewModel,
      required this.channel2ViewModel,
      required this.channel3ViewModel,
      required this.channel4ViewModel,
      this.channelUtil});

  @override
  State<RemoveCommitBar> createState() => _RemoveCommitBarState();
}

class _RemoveCommitBarState extends State<RemoveCommitBar> {
  @override
  void initState() {
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
            KString.removeTargetTitle,
            style: KFont.navTitleStyle,
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              widget.editUtil!.removeRemove!();
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
            onTap: () {
              //发起http请求删除订单
              widget.channel0ViewModel!.deleteOrders();
              widget.channel1ViewModel!.deleteOrders();
              widget.channel2ViewModel!.deleteOrders();
              widget.channel3ViewModel!.deleteOrders();
              widget.channel4ViewModel!.deleteOrders();
              //
              widget.editUtil!.removeRemove!();
              //刷新页面
              //for (var q in widget.channelUtil!.refreshChannels!) {
              //  q();
              //}
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
