import 'package:flutter/material.dart';


import '../../Components/Terminal/future_terminal_card_list.dart';
import '../../Components/Terminal/terminal_search_bar.dart';
import '../../Model/ViewModel/terminal_view_model.dart';
import '../../Util/terminal_util.dart';


import '../../Model/ViewModel/channel0_view_model.dart';
import '../../Model/ViewModel/channel1_view_model.dart';
import '../../Model/ViewModel/channel2_view_model.dart';
import '../../Model/ViewModel/channel3_view_model.dart';
import '../../Model/ViewModel/channel4_view_model.dart';

import '../../Util/channel_util.dart';

class Terminal extends StatefulWidget {
  final TerminalViewModel viewModel;
  final TerminalUtil terminalUtil;
  final Channel0ViewModel channel0ViewModel;
  final Channel1ViewModel channel1ViewModel;
  final Channel2ViewModel channel2ViewModel;
  final Channel3ViewModel channel3ViewModel;
  final Channel4ViewModel channel4ViewModel;
  final ChannelUtil? channelUtil;
  

  const Terminal({super.key, required this.viewModel, 
  required this.terminalUtil, required this.channel0ViewModel,
   required this.channel1ViewModel, required this.channel2ViewModel, 
   required this.channel3ViewModel, required this.channel4ViewModel, this.channelUtil});

  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TerminalSearchBar(), 
        const SizedBox(height: 24), 
        TerminalCardListFuture(viewModel: widget.viewModel, 
        terminalUtil: widget.terminalUtil, 
        channel0ViewModel: widget.channel0ViewModel, channel2ViewModel: widget.channel2ViewModel, 
        channel1ViewModel: widget.channel1ViewModel, channel4ViewModel: widget.channel4ViewModel, 
        channel3ViewModel: widget.channel3ViewModel, channelUtil: widget.channelUtil!,)
        ],
    );
  }
}
