import 'package:flutter/material.dart';
import 'channel_title.dart';
import 'future_channel_card_list.dart';
import '../../Model/ViewModel/channel3_view_model.dart';
import '../../Util/channel_util.dart';

class Channel3 extends StatefulWidget {
  final ChannelUtil channelUtil;
  final Channel3ViewModel viewModel;
  final String? channelName;
  const Channel3({super.key, required this.channelName, required this.viewModel, required this.channelUtil});

  @override
  State<Channel3> createState() => _Channel3State();
}

class _Channel3State extends State<Channel3> {
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
