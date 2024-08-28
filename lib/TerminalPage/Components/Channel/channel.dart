import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/TerminalPage/Components/Channel/channel_card_list.dart';
import './channel_title.dart';
import './future_channel_card_list.dart';

class Channel extends StatefulWidget {
  final String? channelName;
  const Channel({super.key, required this.channelName});

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
        ChannelCardList()
      ],
    );
  }
}
