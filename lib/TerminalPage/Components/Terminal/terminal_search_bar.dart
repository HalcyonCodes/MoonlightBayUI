import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonlight_bay_ui/Config/string.dart';
import '../../../Config/color.dart';
import '../../../Config/shadow.dart';
import '../../../Config/font.dart';

class TerminalSearchBar extends StatefulWidget {
  const TerminalSearchBar({super.key});

  @override
  State<TerminalSearchBar> createState() => _TerminalSearchBarState();
}

class _TerminalSearchBarState extends State<TerminalSearchBar> {

  TextEditingController? ctrl;
  @override
  void initState() {

    super.initState();
    ctrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), 
          boxShadow: [KShadow.shadow],
          color: KColor.containerColor
          
          ),

      height: 46,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //搜索的标题
          Container(
            height: 46,
            decoration: BoxDecoration(
                color: KColor.primaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Text(KString.search, style: KFont.searchBarTitleStyle),
            ),
          ),
          const SizedBox(
            width: 24,
            
          ),
          Expanded(
            child: Container(
              height: 46,
              color: KColor.containerColor,
              alignment: Alignment.center,
              child: TextField(
                controller: ctrl,
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
                onSubmitted: commit,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: KString.inputName,
                  contentPadding: EdgeInsets.zero,
                  hintStyle: KFont.searchBarTipStyle,
                  isDense: true,
                  hintMaxLines: 1,
                ),
                strutStyle: const StrutStyle(leading: 0),
              ),
            ),
          ),
      
        
          const SizedBox(
            width: 24,
          )
        ],
      ),
    );
  }

  void commit(string) {}
}
