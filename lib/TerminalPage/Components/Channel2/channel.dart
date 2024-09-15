import 'package:flutter/material.dart';
import 'channel_title.dart';
import 'future_channel_card_list.dart';
import '../../Model/ViewModel/channel2_view_model.dart';
import '../../Util/channel_util.dart';

class Channel2 extends StatefulWidget {
  final Channel2ViewModel viewModel;
  final ChannelUtil channelUtil;
  final String? channelName;
  const Channel2({super.key, required this.channelName, required this.viewModel, required this.channelUtil});

  @override
  State<Channel2> createState() => _Channel2State();
}

class _Channel2State extends State<Channel2> {
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
