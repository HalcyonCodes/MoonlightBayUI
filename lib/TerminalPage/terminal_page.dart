import 'package:flutter/material.dart';
import './Components/Nav/page_nav.dart';
import '../Config/color.dart';
import 'Components/Terminal/terminal.dart';
import './Components/Channel/channel.dart';
import '../Config/string.dart';
import './Util/edit_util.dart';
import './Model/ViewModel/terminal_view_model.dart';
import './Model/ViewModel/channel_view_model.dart';

class TerminalPage extends StatefulWidget {
  const TerminalPage({super.key});

  @override
  State<TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
  EditUtil? pageEditUtil;
  TerminalViewModel? terminalViewModel;
  ChannelViewModel? channelViewModel0;
  ChannelViewModel? channelViewModel1;
  ChannelViewModel? channelViewModel2;
  ChannelViewModel? channelViewModel3;
  ChannelViewModel? channelViewModel4;

  @override
  void initState() {
    super.initState();
    pageEditUtil = EditUtil();
    terminalViewModel = TerminalViewModel();
    channelViewModel0 = ChannelViewModel();
     channelViewModel1 = ChannelViewModel();
     channelViewModel2 = ChannelViewModel();
     channelViewModel3 = ChannelViewModel();
     channelViewModel4 = ChannelViewModel();
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
                    editUtil: pageEditUtil,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 450,
                    child: Terminal(
                      viewModel: terminalViewModel!,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel(
                      channelName: KString.channel0,
                      viewModel: channelViewModel0!,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel(
                      channelName: KString.channel1,
                      viewModel: channelViewModel1!,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel(
                      channelName: KString.channel2,
                      viewModel: channelViewModel2!,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel(
                      channelName: KString.channel3,
                      viewModel: channelViewModel3!,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 213,
                    child: Channel(
                      channelName: KString.channel4,
                      viewModel: channelViewModel4!,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
