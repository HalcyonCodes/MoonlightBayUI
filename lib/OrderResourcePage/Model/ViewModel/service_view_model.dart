

import 'dart:io';

import 'package:dio/dio.dart';

import '../../../Config/host.dart';
import '../../../Cookie/cookie.dart';
import '../FromJsonModel/service_from_json_model.dart';
import '../DataModel/service_data_model.dart' as tData;


class ServiceViewModel {
  Response? response;
  OrderServiceFromJsonModel? orderResourceFromJsonModel;

  var data = tData.data;

  int? resourceID = 0;
  void setResourceID(int? id) {
    resourceID = id;
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
    //
    response = await dio
        .get('${Host.host}/api/v1/OrderService/GetOrderServicesByResource?orderResourceID=$resourceID');

     orderResourceFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      orderResourceFromJsonModel = OrderServiceFromJsonModel.fromJson(response!.data);
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
      orderResourceFromJsonModel = OrderServiceFromJsonModel.fromJson(data);
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
      orderResourceFromJsonModel = OrderServiceFromJsonModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
}