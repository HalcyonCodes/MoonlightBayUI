import 'dart:io';

import 'package:dio/dio.dart';
import '../FromJsonModel/terminal_from_json_model.dart';
import '../DataModel/terminal_data_model.dart' as tData;

class TerminalViewModel {
  Response? response;
  TerminalFromJsonModel? terminalFromJsonModel;

  var data = tData.data;

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
