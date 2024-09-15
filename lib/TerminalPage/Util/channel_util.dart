class ChannelUtil {
  Function? _refreshUi;
  Function? get refreshUi => _refreshUi;
  void setrefreshUi(Function? value) {
    _refreshUi = value;
  }

  //刷新所有channel
  List<Function>? _refreshChannels = [];
  List<Function>? get refreshChannels => _refreshChannels;
  void addFuncRefreshChannels(Function? value) {
   _refreshChannels!.add(value!);
  }
  void removeFuncRefreshChannels(Function? value) {
    _refreshChannels!.remove(value!);
  }

}
