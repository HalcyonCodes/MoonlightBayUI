import 'dart:io';

import 'package:dio/dio.dart';

import '../../../Cookie/cookie.dart';
import '../FromJsonModel/order_resource_picker_from_json_model.dart';

import '../DataModel/order_resource_picker_data_model.dart' as tData;

class OrderResourcePickerViewModel {
  Response? response;
  OrderResourceFromJsonModel? orderResourceFromJsonModel;

  var data = tData.data;

 

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
    response = await dio.get(
        'http://localhost:5036/api/v1/OrderService/GetOrderServiceResourcesUI');
    orderResourceFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      orderResourceFromJsonModel =
          OrderResourceFromJsonModel.fromJson(response!.data);
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
