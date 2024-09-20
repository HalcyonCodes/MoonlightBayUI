import 'dart:io';

import 'package:dio/dio.dart';

import '../../../Cookie/cookie.dart';
import '../FromJsonModel/channel_from_json_model.dart';
import '../DataModel/channel_data_model.dart' as tData;

class Channel2ViewModel {
  Response? response;
  ChannelFromJsonModel? channelFromJsonModel;

  var data = tData.data;

  String? _currentTerminalID;
  String? get currentTerminalID => _currentTerminalID;
  void setCurrentTerminalID(String? value) {
    _currentTerminalID = value;
  }

  //终端当前订单
  List<String>? _currentOrderID = [];
  List<String>? get currentOrderID => _currentOrderID;
  void addCurrentOrderID(String? value) {
    _currentOrderID!.add(value!);
  }
  void removeCurrentOrderID(String? value) {
    _currentOrderID!.remove(value!);
  }
    //向服务器发送删除订单请求
  Future<int> deleteOrders() async {

    Map<String, dynamic> data = {
      "terminalID": _currentTerminalID,
      "orderID": currentOrderID,
    };
    response = null;
    //
    response = await Dio().get('www.baidu.com');
    if (response!.statusCode == HttpStatus.ok) {
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }


   //refresh
  Future<int> refresh() async {
           response = null;
    //
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 从本地存储获取JWT令牌
        String token = JwtManager.getJwtCookie();
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));
    response = await dio
        .get('http://localhost:5036/api/v1/Order/GetOrderChannel?channelLevels=2&terminalID=' + currentTerminalID.toString());
    channelFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      channelFromJsonModel = ChannelFromJsonModel.fromJson(response!.data);
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
