import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonlight_bay_ui/Config/font.dart';
import 'package:moonlight_bay_ui/Config/string.dart';

import 'edit_commit_bar.dart';
import '../../../Config/decoration.dart';
import '../../../Config/color.dart';
import '../../Util/edit_util.dart';
import '../../Model/ViewModel/terminal_view_model.dart';

class LoginEdit extends StatefulWidget {
  final EditUtil? editUtil;
  final  TerminalViewModel? terminalViewModel;
  const LoginEdit({super.key, required this.editUtil, this.terminalViewModel});

  @override
  State<LoginEdit> createState() => _LoginEditState();
}

class _LoginEditState extends State<LoginEdit> {
  TextEditingController? ctrl1;
  TextEditingController? ctrl2;

  @override
  void initState() {
    super.initState();
    ctrl1 = TextEditingController();
    ctrl2 = TextEditingController();

    widget.editUtil!.setTextEditingController1(ctrl1);
    widget.editUtil!.setTextEditingController2(ctrl2);
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
              child: EditCommitBar(
                editUtil: widget.editUtil, terminalViewModel: widget.terminalViewModel!,
              )),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '用户名',
              style: KFont.cardGreyStyle,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          //Padding(
            ////padding: const EdgeInsets.symmetric(horizontal: 24),
            //child: Expanded(
              //child: 
              Container(
                margin:const  EdgeInsetsDirectional.symmetric(horizontal: 24),
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
                    //hintText: KString.inputTerminalName,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: KFont.searchBarTipStyle,
                    isDense: true,
                    hintMaxLines: 1,
                  ),
                  strutStyle: const StrutStyle(leading: 0),
                ),
             // ),
            //),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '用户密码',
              style: KFont.cardGreyStyle,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
         // Padding(
           // padding: const EdgeInsets.symmetric(horizontal: 24),
           // child: Expanded(
             // child:
               Container(
                margin:const  EdgeInsetsDirectional.symmetric(horizontal: 24),
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
                    //hintText: KString.editTerminalDesc,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: KFont.searchBarTipStyle,
                    isDense: true,
                    hintMaxLines: 1,
                  ),
                  strutStyle: const StrutStyle(leading: 0),
                ),
             // ),
          //  ),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
