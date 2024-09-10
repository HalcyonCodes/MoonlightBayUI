import 'dart:io';

import 'package:dio/dio.dart';


import '../FromJsonModel/order_service_from_json_model.dart';

import '../DataModel/order_service_data_model.dart' as tData;

class OrderServiceViewModel {
  Response? response;
  OrderServiceFromJsonModel? fromJsonModel;

  var data = tData.data;

  //refresh
  Future<int> refresh() async {
    response = null;
    //
    response = await Dio().get('www.baidu.com');
    fromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      fromJsonModel = OrderServiceFromJsonModel.fromJson(data);
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
    fromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      fromJsonModel = OrderServiceFromJsonModel.fromJson(data);
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
       response = await Dio().get('www.baidu.com');
    fromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      fromJsonModel = OrderServiceFromJsonModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
}
