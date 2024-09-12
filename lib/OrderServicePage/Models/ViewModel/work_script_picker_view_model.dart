


import 'dart:io';

import 'package:dio/dio.dart';




import '../DataModel/work_script_picker_data_model.dart' as tData;
import '../FromJsonModel/work_script_picker_from_json_model.dart';

class WorkScriptPickerViewModel {
  Response? response;
  WorkScriptPickerFromJsonModel? fromJsonModel;

  var data = tData.data;

  //refresh
  Future<int> refresh() async {
    response = null;
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
