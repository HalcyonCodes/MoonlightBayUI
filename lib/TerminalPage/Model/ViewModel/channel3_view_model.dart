import 'dart:io';

import 'package:dio/dio.dart';

import '../FromJsonModel/channel_from_json_model.dart';
import '../DataModel/channel_data_model.dart' as tData;

class Channel3ViewModel {
  Response? response;
  ChannelFromJsonModel? channelFromJsonModel;

  var data = tData.data;

  String? _currentTerminalID;
  String? get currentTerminalID => _currentTerminalID;
  void setCurrentTerminalID(String? value) {
    _currentTerminalID = value;
  }
  
   //refresh
  Future<int> refresh() async {
    response = null;
    //
    response = await Dio().get('www.baidu.com');
    channelFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      channelFromJsonModel= ChannelFromJsonModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
  

  //loadMore
  Future<int> loadMore() async {
    response = null;
    //
    //response = await Dio().get('http://localhost:4040/');
    //
    response = await Dio().get('www.baidu.com');
    channelFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      channelFromJsonModel= ChannelFromJsonModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //loadPre
  Future<int> loadPre() async {
    response = null;
    //
    //response = await Dio().get('http://localhost:4040/');
    //
    channelFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      channelFromJsonModel= ChannelFromJsonModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }


}
