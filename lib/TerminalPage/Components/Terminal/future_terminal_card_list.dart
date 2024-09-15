import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/TerminalPage/Util/terminal_util.dart';
import '../../Components/Terminal/terminal_card_list.dart';

import '../../Model/ViewModel/terminal_view_model.dart';
import '../../Model/ViewModel/channel0_view_model.dart';
import '../../Model/ViewModel/channel1_view_model.dart';
import '../../Model/ViewModel/channel2_view_model.dart';
import '../../Model/ViewModel/channel3_view_model.dart';
import '../../Model/ViewModel/channel4_view_model.dart';
import '../../Util/channel_util.dart';

class TerminalCardListFuture extends StatefulWidget {
  final TerminalViewModel viewModel;
  final TerminalUtil terminalUtil;
  final Channel0ViewModel channel0ViewModel;
  final Channel1ViewModel channel1ViewModel;
  final Channel2ViewModel channel2ViewModel;
  final Channel3ViewModel channel3ViewModel;
  final Channel4ViewModel channel4ViewModel;
  final ChannelUtil channelUtil;
  

  const TerminalCardListFuture({super.key, required this.viewModel, required this.terminalUtil, required this.channel0ViewModel, required this.channel1ViewModel, required this.channel2ViewModel, required this.channel3ViewModel, required this.channel4ViewModel, required this.channelUtil});

  @override
  State<TerminalCardListFuture> createState() => _TerminalCardListFutureState();
}

class _TerminalCardListFutureState extends State<TerminalCardListFuture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('none');

            case ConnectionState.active:
              return const Text('active');

            case ConnectionState.waiting:
              return const Text('waiting');

            case ConnectionState.done:
              return TerminalCardList(
                viewModel: widget.viewModel,
                terminalUtil: widget.terminalUtil, channel0ViewModel: widget.channel0ViewModel, 
                channel1ViewModel: widget.channel1ViewModel, 
                channel2ViewModel: widget.channel2ViewModel, channel3ViewModel: widget.channel3ViewModel, 
                channel4ViewModel: widget.channel4ViewModel,
                channelUtil: widget.channelUtil,

              );
          }
        });
  }
}
