import 'dart:io';

import 'package:dio/dio.dart';

import '../../../Cookie/cookie.dart';
import '../FromJsonModel/resource_from_json_model.dart';
import '../DataModel/resource_data_model.dart' as tData;

class ResourceViewModel {
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
    response = await dio
        .get('http://localhost:5036/api/v1/OrderService/GetOrderServiceResourcesPage?pageIndex=0');

    orderResourceFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      orderResourceFromJsonModel = OrderResourceFromJsonModel.fromJson(response!.data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //当前选中的项目
  String? _currentID;
  String? get currentID => _currentID;
  void setCurrentID(String id) {
    _currentID = id;
  }

  //删除选中的项目
  Future<int> deleteItem() async {
    var data = {"orderServiceResourceID": currentID};
     
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
        .post('http://localhost:5036/api/v1/OrderService/DeleteOrderServiceResource', data: data);
    return response!.statusCode!;
  }

  //添加项目
  Future<int> addItem(String name, String desc) async {
    var data = {"orderServiceResourceName": name, "orderServiceResourceDesc": desc};

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
        .post('http://localhost:5036/api/v1/OrderService/AddOrderServiceResource',data: data);
    return response!.statusCode!;

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
        .get('http://localhost:5036/api/v1/OrderService/GetOrderServiceResourcesPage?pageIndex=$pageIndex');

    orderResourceFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      orderResourceFromJsonModel = OrderResourceFromJsonModel.fromJson(response!.data);
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
        .get('http://localhost:5036/api/v1/OrderService/GetOrderServiceResourcesPage?pageIndex=$pageIndex');

    orderResourceFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      orderResourceFromJsonModel = OrderResourceFromJsonModel.fromJson(response!.data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
}
