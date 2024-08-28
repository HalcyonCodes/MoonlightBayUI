import 'package:flutter/material.dart';
import './Components/Nav/page_nav.dart';
import '../Config/color.dart';
import 'Components/Terminal/terminal.dart';
import './Components/Channel/channel.dart';
import '../Config/string.dart';

class TerminalPage extends StatefulWidget {
  const TerminalPage({super.key});

  @override
  State<TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
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
                  const PageNav(),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 450,
                    child: Terminal(),
                  ),
                  SizedBox(width: 24,),
                  SizedBox(
                    width: 213,
                    child: Channel(channelName: KString.channel0,),
                  ),
                  SizedBox(width: 24,),
                  SizedBox(
                    width: 213,
                    child: Channel(channelName: KString.channel1,),
                  ),
                  SizedBox(width: 24,),
                  SizedBox(
                    width: 213,
                    child: Channel(channelName: KString.channel2,),
                  ),
                  SizedBox(width: 24,),
                  SizedBox(
                    width: 213,
                    child: Channel(channelName: KString.channel3,),
                  ),
                  SizedBox(width: 24,),
                  SizedBox(
                    width: 213,
                    child: Channel(channelName: KString.channel4,),
                  ),
                  
                ],
              ),
            )),
      ),
    );
  }
}
