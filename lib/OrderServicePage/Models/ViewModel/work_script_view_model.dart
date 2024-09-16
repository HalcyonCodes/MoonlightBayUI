import 'dart:io';

import 'package:dio/dio.dart';

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
    var data = {"name": name, "desc": desc};
    response = null;
    response = await Dio().get('www.baidu.com');

    if (response!.statusCode == HttpStatus.ok) {
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //提交添加的script
  Future<int> commitAddScript() async {
    WorkScript? workScript = fromJsonModel!.data!.workScripts![0];
    WorkScriptToJson workScriptToJson = WorkScriptToJson.toJsonModel(workScript);
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
    fromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      fromJsonModel = WorkScriptFromJsonModel.fromJson(data);
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
