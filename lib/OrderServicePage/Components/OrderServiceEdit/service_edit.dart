import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import 'package:moonlight_bay_ui/Config/string.dart';

import 'service_edit_commit_bar.dart';
import '../../../Config/decoration.dart';
import '../../../Config/color.dart';
import '../../Util/edit_util.dart';

class ServiceEdit extends StatefulWidget {
  final EditUtil? editUtil;
  const ServiceEdit({super.key, required this.editUtil});

  @override
  State<ServiceEdit> createState() => _ServiceEditState();
}

class _ServiceEditState extends State<ServiceEdit> {
  TextEditingController? ctrl1;
  TextEditingController? ctrl2;

  @override
  void initState() {
    super.initState();
    ctrl1 = TextEditingController();
    ctrl2 = TextEditingController();
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KDecoration.cardDecoration,
      width: 658,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: EditCommitBar(editUtil: widget.editUtil,)),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              KString.serviceName,
              style: KFont.cardGreyStyle,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
         //Padding(
           // padding: const EdgeInsets.symmetric(horizontal: 24),
            //child: 
            //Expanded(
              //child:
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: 26,
                color: KColor.containerColor,
                alignment: Alignment.center,
                child: TextField(
                  controller: ctrl1,
                  maxLines: 1,
                  style: KFont.searchBarInputStyle,
                  autofocus: false,
                  cursorColor: Colors.black,
                  cursorWidth: 2,
                  cursorHeight: 22,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(200),
                  ],
                  maxLength: null,
                  onSubmitted: (q) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    //hintText: KString.inputOrderServiceResourceName,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: KFont.searchBarTipStyle,
                    isDense: true,
                    hintMaxLines: 1,
                  ),
                  strutStyle: const StrutStyle(leading: 0),
               // ),
              //),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              KString.serviceDesc,
              style: KFont.cardGreyStyle,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          //Padding(
           // padding: const EdgeInsets.symmetric(horizontal: 24),
            //child: 
            //Expanded(
              //child: 
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: 26,
                color: KColor.containerColor,
                alignment: Alignment.center,
                child: TextField(
                  controller: ctrl2,
                  maxLines: 1,
                  style: KFont.searchBarInputStyle,
                  autofocus: false,
                  cursorColor: Colors.black,
                  cursorWidth: 2,
                  cursorHeight: 22,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(200),
                  ],
                  maxLength: null,
                  onSubmitted: (q) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    //hintText: KString.inputOrderServiceResourceDesc,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: KFont.searchBarTipStyle,
                    isDense: true,
                    hintMaxLines: 1,
                  ),
                  strutStyle: const StrutStyle(leading: 0),
                ),
              //),
            //),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
