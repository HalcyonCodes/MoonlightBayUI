import 'package:flutter/material.dart';

import '../../Model/ViewModel/channel_view_model.dart';

import '../../Components/Channel/channel_card_list.dart';

class ChannelCardListFuture extends StatefulWidget {
  final ChannelViewModel viewModel;
  const ChannelCardListFuture({super.key, required this.viewModel});

  @override
  State<ChannelCardListFuture> createState() => _ChannelCardListFutureState();
}

class _ChannelCardListFutureState extends State<ChannelCardListFuture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('none');

            case ConnectionState.active:
              return const Text('active');

            case ConnectionState.waiting:
              return const Text('waiting');

            case ConnectionState.done:
              return ChannelCardList(
                viewModel: widget.viewModel,
              );
          }
        });
  }
}
