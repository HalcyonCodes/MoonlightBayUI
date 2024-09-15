import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/TerminalPage/Util/channel_util.dart';
import 'channel_title.dart';
import 'future_channel_card_list.dart';
import '../../Model/ViewModel/channel0_view_model.dart';

class Channel0 extends StatefulWidget {
  final Channel0ViewModel viewModel;
  final String? channelName;
  final ChannelUtil channelUtil;
  const Channel0(
      {super.key, required this.channelName, required this.viewModel, required this.channelUtil});

  @override
  State<Channel0> createState() => _Channel0State();
}

class _Channel0State extends State<Channel0> {
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
