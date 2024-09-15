import 'package:flutter/material.dart';
import '../../../Config/font.dart';
import '../../../Config/shadow.dart';

import './remove_commit_bar.dart';
import '../../../Config/string.dart';
import '../../Util/edit_util.dart';
import '../../Model/ViewModel/channel0_view_model.dart';
import '../../Model/ViewModel/channel0_view_model.dart';
import '../../Model/ViewModel/channel1_view_model.dart';
import '../../Model/ViewModel/channel2_view_model.dart';
import '../../Model/ViewModel/channel3_view_model.dart';
import '../../Model/ViewModel/channel4_view_model.dart';

class Remove extends StatefulWidget {
  final Channel0ViewModel? channel0ViewModel;
  final Channel1ViewModel? channel1ViewModel;
  final Channel2ViewModel? channel2ViewModel;
  final Channel3ViewModel? channel3ViewModel;
  final Channel4ViewModel? channel4ViewModel;
  final EditUtil editUtil;

  const Remove({super.key, required this.editUtil,  required this.channel0ViewModel,required this.channel1ViewModel, 
  required this.channel2ViewModel, required this.channel3ViewModel, required this.channel4ViewModel});

  @override
  State<Remove> createState() => _RemoveState();
}

class _RemoveState extends State<Remove> {
  


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [KShadow.shadow]),
      width: 658,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RemoveCommitBar(editUtil: widget.editUtil, 
          channel0ViewModel: widget.channel0ViewModel, 
          channel1ViewModel: widget.channel1ViewModel, 
          channel2ViewModel: widget.channel2ViewModel,
           channel3ViewModel: widget.channel3ViewModel, 
           channel4ViewModel: widget.channel4ViewModel,),
          const SizedBox(
            height: 12,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                KString.removeTip,
                style: KFont.searchBarInputStyle,
              )),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
