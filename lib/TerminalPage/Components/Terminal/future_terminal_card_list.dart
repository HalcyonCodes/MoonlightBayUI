import 'package:flutter/material.dart';
import 'package:moonlight_bay_ui/TerminalPage/Components/Terminal/terminal_card_list.dart';
import '../../Model/ViewModel/terminal_view_model.dart';

class TerminalCardListFuture extends StatefulWidget {
  final TerminalViewModel viewModel;

  const TerminalCardListFuture({super.key, required this.viewModel});

  @override
  State<TerminalCardListFuture> createState() => _TerminalCardListFutureState();
}

class _TerminalCardListFutureState extends State<TerminalCardListFuture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.done:
              return TerminalCardList();
          }
        });
  }
}
