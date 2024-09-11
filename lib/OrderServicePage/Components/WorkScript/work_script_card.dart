import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import 'package:moonlight_bay_ui/Config/string.dart';
import '../../../Config/decoration.dart';

class WorkScriptCard extends StatelessWidget {
  final String? id;
  final String? bindingCount;
  final String? name;
  final String? desc;

  const WorkScriptCard(
      {super.key,
      required this.id,
      required this.bindingCount,
      required this.name,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: (){},
        child: Container(
          decoration: KDecoration.cardDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[ 
                    Text(id!, style: KFont.cardGreyStyle,),
                    const Expanded(child: SizedBox()),
                    Text(KString.scriptBindingCount + bindingCount!, style: KFont.cardGreyStyle,)
                  ]),
                const SizedBox(height: 24,),
                Text(name!, style: KFont.cardNameStyle,),
                const SizedBox(height: 12,),
                Text(desc!, style: KFont.cardGreyStyle,),
              ],
            ),
            ),
        ),
      ),
    );
  }
}
