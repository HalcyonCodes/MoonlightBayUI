import 'dart:io';

import 'package:dio/dio.dart';

import '../FromJsonModel/order_resource_from_json_model.dart';

import '../DataModel/order_resource_data_model.dart' as tData;

import '../ToJsonModel/order_resource_to_json_model.dart';

class OrderResourceViewModel {
  Response? response;
  OrderResourceFromJsonModel? orderResourceFromJsonModel;

  var data = tData.data;

  //设置当前要发起请求的orderServiceID
  String? _orderServiceID;
  String? get orderServiceID => _orderServiceID;
  void setOrderServiceID(String orderServiceID) {
    _orderServiceID = orderServiceID;
  }

  //提交添加resources
  Future<int> commitAddResources() async {
    List<OrderResource>? resources =
        orderResourceFromJsonModel!.data.orderResources;
    SettingOrderResourceToJson json = SettingOrderResourceToJson.toJsonModel(resources!);
    //通过json和dio发起http请求
    response = null;
    //
    response = await Dio().get('www.baidu.com');
    return response!.statusCode!;
  }

  //refresh
  Future<int> refresh() async {
    response = null;
    //
    response = await Dio().get('www.baidu.com');

    orderResourceFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      orderResourceFromJsonModel = OrderResourceFromJsonModel.fromJson(data);
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
    orderResourceFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      orderResourceFromJsonModel = OrderResourceFromJsonModel.fromJson(data);
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
    orderResourceFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      orderResourceFromJsonModel = OrderResourceFromJsonModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
}
