import 'dart:io';

import 'package:dio/dio.dart';


import '../../../Config/host.dart';
import '../../../Cookie/cookie.dart';
import '../FromJsonModel/order_service_from_json_model.dart';

import '../DataModel/order_service_data_model.dart' as tData;
import '../ToJsonModel/order_service_to_json_model.dart';

class OrderServiceViewModel {
  Response? response;
  OrderServiceFromJsonModel? fromJsonModel;

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
    response = await dio
        .get('${Host.host}/api/v1/OrderService/GetOrderServicesByPageIndex?pageIndex=0');

    fromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      fromJsonModel = OrderServiceFromJsonModel.fromJson(response!.data);
      return response!.statusCode!;
    } else {
      //fromJsonModel = OrderServiceFromJsonModel.fromJson(response!.data);
      return response!.statusCode!;
    }
  }

  //loadMore
  Future<int> loadMore(String pageIndex) async {
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
        .get('${Host.host}/api/v1/OrderService/GetOrderServicesByPageIndex?pageIndex=$pageIndex');

    fromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      fromJsonModel = OrderServiceFromJsonModel.fromJson(response!.data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //loadPre
  Future<int> loadPre(String pageIndex) async {
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
        .get('${Host.host}/api/v1/OrderService/GetOrderServicesByPageIndex?pageIndex=$pageIndex');

    fromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      fromJsonModel = OrderServiceFromJsonModel.fromJson(response!.data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }



  //提交添加的服务
   Future<int> addCommit(String name, String desc) async {
    



    response = null;
    //添加参数至dio链接
    
    response = await Dio().get('www.baidu.com');
    fromJsonModel = null;
   
      fromJsonModel = OrderServiceFromJsonModel.fromJson(data);
    return response!.statusCode!;
  
  
  }


}
