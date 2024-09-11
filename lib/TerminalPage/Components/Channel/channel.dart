import 'package:flutter/material.dart';
import './channel_title.dart';
import './future_channel_card_list.dart';
import '../../Model/ViewModel/channel_view_model.dart';

class Channel extends StatefulWidget {
  final ChannelViewModel viewModel;
  final String? channelName;
  const Channel({super.key, required this.channelName, required this.viewModel});

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
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
        )
      ],
    );
  }
}
