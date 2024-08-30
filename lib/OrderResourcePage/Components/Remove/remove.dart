import 'package:flutter/material.dart';
import '../../../Config/font.dart';
import '../../../Config/shadow.dart';


import './remove_commit_bar.dart';
import '../../../Config/string.dart';

class Remove extends StatefulWidget {
  const Remove({super.key});

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
        boxShadow: [KShadow.shadow]

      ),
      width: 658,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RemoveCommitBar(),
            const SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(KString.removeOrderServiceResource, style: KFont.searchBarInputStyle,)),
            const SizedBox(height: 12,)
        
          ],

      ),
    );
  }
}
