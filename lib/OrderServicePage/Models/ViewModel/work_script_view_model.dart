import 'dart:io';

import 'package:dio/dio.dart';

import '../../../Cookie/cookie.dart';
import '../DataModel/work_script_data_model.dart' as tData;
import '../FromJsonModel/work_script_from_json_model.dart';
import '../ToJsonModel/order_script_to_json_model.dart';

class WorkScriptViewModel {
  Response? response;
  WorkScriptFromJsonModel? fromJsonModel;

  var data = tData.data;

  //设置当前要发起请求的orderServiceID
  String? _orderServiceID;
  String? get orderServiceID => _orderServiceID;
  void setOrderServiceID(String orderServiceID) {
    _orderServiceID = orderServiceID;
  }

  //添加项目
  Future<int> addItem(String name, String desc) async {
    var data = {"orderServiceScriptName": name, "orderServiceDesc": desc};
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
        .post('http://localhost:5036/api/v1/OrderService/AddOrderServiceWorkScript', data: data
        );
    return response!.statusCode!;
  }

  //提交添加的script
  Future<int> commitAddScript() async {
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
    String workScriptID = fromJsonModel!.data!.workScripts![0].id!;
    String serviceID = orderServiceID!;
    data = {"scriptID": workScriptID, "orderServiceID": serviceID};

    response = await dio
        .post('http://localhost:5036/api/v1/OrderService/AddOrderServiceWorkScriptToOrderSerivceUI', data: data
        );

    return response!.statusCode!;

    
    
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
        .get('http://localhost:5036/api/v1/OrderService/GetOrderServiceWorkScriptUI?serviceID=${orderServiceID!}');

    fromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      fromJsonModel = WorkScriptFromJsonModel.fromJson(response!.data);
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
      fromJsonModel = WorkScriptFromJsonModel.fromJson(data);
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
      fromJsonModel = WorkScriptFromJsonModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
}
