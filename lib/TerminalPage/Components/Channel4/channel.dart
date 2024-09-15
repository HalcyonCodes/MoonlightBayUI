import 'package:flutter/material.dart';
import 'channel_title.dart';
import 'future_channel_card_list.dart';
import '../../Model/ViewModel/channel4_view_model.dart';
import '../../Util/channel_util.dart';

class Channel4 extends StatefulWidget {
  final ChannelUtil channelUtil;
  final Channel4ViewModel viewModel;
  final String? channelName;
  const Channel4(
      {super.key, required this.channelName, required this.viewModel, required this.channelUtil});

  @override
  State<Channel4> createState() => _Channel4State();
}

class _Channel4State extends State<Channel4> {
  String? channelName;
  @override
  void initState() {
    super.initState();
    channelName = widget.channelName;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ChannelTitle(channelName: channelName),
        const SizedBox(
          height: 24,
        ),
        ChannelCardListFuture(
          viewModel: widget.viewModel,
          channelUtil: widget.channelUtil,
        )
      ],
    );
  }
}
