import 'package:flutter/material.dart';
import './Components/Nav/page_nav.dart';
import '../Config/color.dart';
import 'Components/Terminal/terminal.dart';
import 'Components/Channel0/channel.dart';
import '../Config/string.dart';
import './Util/edit_util.dart';
import './Model/ViewModel/terminal_view_model.dart';
import 'Model/ViewModel/channel0_view_model.dart';
import 'Model/ViewModel/channel1_view_model.dart';
import 'Model/ViewModel/channel2_view_model.dart';
import 'Model/ViewModel/channel3_view_model.dart';
import 'Model/ViewModel/channel4_view_model.dart';
import './Util/terminal_util.dart';

import './Components/Channel1/channel.dart';
import './Components/Channel2/channel.dart';
import './Components/Channel3/channel.dart';
import './Components/Channel4/channel.dart';
import './Util/channel_util.dart';

class TerminalPage extends StatefulWidget {
  

  const TerminalPage({super.key});

  @override
  State<TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
  EditUtil? pageEditUtil;
  TerminalViewModel? terminalViewModel;
  Channel0ViewModel? channelViewModel0;
  Channel1ViewModel? channelViewModel1;
  Channel2ViewModel? channelViewModel2;
  Channel3ViewModel? channelViewModel3;
  Channel4ViewModel? channelViewModel4;
  TerminalUtil? terminalUtil;
  ChannelUtil? channelUtil;


  @override
  void initState() {
    super.initState();
    pageEditUtil = EditUtil();
    terminalViewModel = TerminalViewModel();
    channelViewModel0 = Channel0ViewModel();
     channelViewModel1 = Channel1ViewModel();
     channelViewModel2 = Channel2ViewModel();
     channelViewModel3 = Channel3ViewModel();
     channelViewModel4 = Channel4ViewModel();
     terminalUtil = TerminalUtil();
     channelUtil = ChannelUtil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width <= 1920 ? 1920 : 1920,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PageNav(
                    editUtil: pageEditUtil, terminalViewModel: terminalViewModel!,
                    channel0ViewModel: channelViewModel0!, 
                    channel1ViewModel: channelViewModel1!, 
                    channel2ViewModel: channelViewModel2!, 
                    channel3ViewModel: channelViewModel3!, 
                    channel4ViewModel: channelViewModel4!,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 450,
                    child: Terminal(
                      channelUtil: channelUtil!,
                      viewModel: terminalViewModel!,
                      terminalUtil: terminalUtil!, channel0ViewModel: channelViewModel0!, channel2ViewModel: channelViewModel2!, 
                      channel1ViewModel: channelViewModel1!, channel3ViewModel: channelViewModel3!, channel4ViewModel: channelViewModel4!,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel0(
                      channelName: KString.channel0,
                      viewModel: channelViewModel0!,
                      channelUtil: channelUtil!,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel1(
                      channelName: KString.channel1,
                      viewModel: channelViewModel1!,
                      channelUtil: channelUtil!,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel2(
                      channelName: KString.channel2,
                      viewModel: channelViewModel2!,
                       channelUtil: channelUtil!
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel3(
                      channelName: KString.channel3,
                      viewModel: channelViewModel3!,
                       channelUtil: channelUtil!
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel4(
                      channelName: KString.channel4,
                      viewModel: channelViewModel4!,
                       channelUtil: channelUtil!
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
