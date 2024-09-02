import 'package:flutter/material.dart';


import '../../Components/Terminal/future_terminal_card_list.dart';
import '../../Components/Terminal/terminal_search_bar.dart';
import '../../Model/ViewModel/terminal_view_model.dart';


class Terminal extends StatefulWidget {
  final TerminalViewModel viewModel;

  Terminal({super.key, required this.viewModel});

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
        TerminalCardListFuture(viewModel: widget.viewModel,)
        ],
    );
  }
}
