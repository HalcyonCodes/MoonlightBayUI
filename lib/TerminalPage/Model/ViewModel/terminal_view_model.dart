import 'dart:io';

import 'package:dio/dio.dart';
import '../FromJsonModel/terminal_from_json_model.dart';
import '../DataModel/terminal_data_model.dart' as tData;

class TerminalViewModel {
  Response? response;
  TerminalFromJsonModel? terminalFromJsonModel;

  var data = tData.data;



  //写入teminalID确定当前所选中的终端
  String? _currentTerminalID;
  String? get currentTerminalID => _currentTerminalID;
  void setCurrentTerminalID(String? value) {
    _currentTerminalID = value;
  }

  //提交修改终端名字和简介
  Future<int> submitTerminalEdit(String terminalNamem, String desc) async{
    Map<String, dynamic> data = {
      'terminalID': _currentTerminalID,
      "terminalName": terminalNamem,
      "desc": desc,
    };
    response = null;
    response = await Dio().get('www.baidu.com');
    terminalFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //修改终端状态
  Future<int> setTerminalStatus(int status) async{
    Map<String, dynamic> data = {
      'terminalID': _currentTerminalID,
      "status": status,
    };

    response = null;
    response = await Dio().get('www.baidu.com');
    terminalFromJsonModel = null;
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
    response = await Dio().get('www.baidu.com');
    terminalFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      terminalFromJsonModel = TerminalFromJsonModel.fromJson(data);
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
    terminalFromJsonModel = null;

    if (response!.statusCode == HttpStatus.ok) {
      terminalFromJsonModel = TerminalFromJsonModel.fromJson(data);
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
    terminalFromJsonModel = null;
    response = await Dio().get('www.baidu.com');

    if (response!.statusCode == HttpStatus.ok) {
      terminalFromJsonModel = TerminalFromJsonModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //removePre

  //search
  //Future<int> seachr()
}
