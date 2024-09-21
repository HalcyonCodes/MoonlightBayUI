import 'dart:io';

import 'package:dio/dio.dart';

import '../../../Cookie/cookie.dart';
import '../DataModel/work_script_picker_data_model.dart' as tData;
import '../FromJsonModel/work_script_picker_from_json_model.dart';

class WorkScriptPickerViewModel {
  Response? response;
  WorkScriptPickerFromJsonModel? fromJsonModel;

  var data = tData.data;

  String? _scriptID;
  String? get scriptID => _scriptID;
  void setScriptID(String? value) {
    _scriptID = value;
  }

  //发起删除请求
  Future<int> removeScript() async{
    var data = {'orderServiceScriptID': scriptID};
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
        .post('http://localhost:5036/api/v1/OrderService/DeleteOrderServiceWorkScript',data: data);
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
        .get('http://localhost:5036/api/v1/OrderService/GetOrderServiceWorkScriptsUI');

    fromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      fromJsonModel = WorkScriptPickerFromJsonModel.fromJson(response!.data);
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
      fromJsonModel = WorkScriptPickerFromJsonModel.fromJson(data);
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
      fromJsonModel = WorkScriptPickerFromJsonModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
}
