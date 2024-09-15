import 'package:flutter/material.dart';

import '../../Model/ViewModel/channel4_view_model.dart';

import 'channel_card_list.dart';
import '../../Util/channel_util.dart';

class ChannelCardListFuture extends StatefulWidget {
  final Channel4ViewModel viewModel;
  final ChannelUtil channelUtil;
  const ChannelCardListFuture({super.key, required this.viewModel, required this.channelUtil});

  @override
  State<ChannelCardListFuture> createState() => _ChannelCardListFutureState();
}

class _ChannelCardListFutureState extends State<ChannelCardListFuture> {

    @override
  void initState() {
    super.initState();
    widget.channelUtil.addFuncRefreshChannels(refreshUi);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.channelUtil.removeFuncRefreshChannels(refreshUi);
  }
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
  void refreshUi() {
    setState(() {});
  }
}
