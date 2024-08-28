import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/TerminalPage/Components/Terminal/terminal_card_list.dart';
import 'package:moonlight_bay_ui/TerminalPage/Components/Terminal/terminal_search_bar.dart';

class Terminal extends StatefulWidget {
  const Terminal({super.key});

  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TerminalSearchBar(), 
        SizedBox(height: 24), 
        TerminalCardList()
        ],
    );
  }
}
