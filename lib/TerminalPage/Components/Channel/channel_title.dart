import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import '../../../Config/decoration.dart';

class ChannelTitle extends StatefulWidget {
  final String? channelName;
  const ChannelTitle({super.key, required this.channelName});

  @override
  State<ChannelTitle> createState() => _ChannelTitleState();
}

class _ChannelTitleState extends State<ChannelTitle> {
  String? channelName;

  @override
  void initState() {
    super.initState();
    channelName = widget.channelName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 213,
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical:13 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 18,
                width: 18,
                child: SvgPicture.asset('Svg/channel.svg')
              ),
            const SizedBox(width: 4,),
            Text(channelName!, style: KFont.channelTitleStyle,),
            
          ],
        ),
      ),
    );
  }
}
