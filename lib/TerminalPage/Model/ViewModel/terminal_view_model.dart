import 'dart:io';

import 'package:dio/dio.dart';
import '../../../Config/host.dart';
import '../FromJsonModel/terminal_from_json_model.dart';
import '../DataModel/terminal_data_model.dart' as tData;
import '../../../Cookie/cookie.dart';

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
  Future<int> submitTerminalEdit(String terminalNamem, String desc, String terminalIP) async {
    Map<String, dynamic> qdata = {
      'terminalID': _currentTerminalID,
      "terminalName": terminalNamem,
      "desc": desc,
      "terminalIP": terminalIP,
    };
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
        .post('${Host.host}/api/v1/Termianl/UpdateTerminal', data: qdata);

      return response!.statusCode!;
  }

  //提交用户登录
  Future<int> submitLogin(String userName, String password) async {
    Map<String, dynamic> data = {
      'userName': userName,
      "password": password,
    };
    response = null;
    //response = await Dio().get('www.baidu.com');

    response = await Dio()
        .post('${Host.host}/api/v1/Account/Login', data: data);
    terminalFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      //保存token
      String? jwt = response!.data['Access_token'];
      //保存到cookie
      JwtManager.setJwtCookie(jwt!, 7);
      //String jwtq = JwtManager.getJwtCookie();

      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //修改终端状态
  Future<int> setTerminalStatus(int status) async {
    Map<String, dynamic> qdata = {
      'terminalID': currentTerminalID,
      "status": status,
    };

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
        .post('${Host.host}/api/v1/Termianl/SetTerminalStatus', data: qdata);

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
        .get('${Host.host}/api/v1/Termianl/GetTerminals?pageIndex=0');

    terminalFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      terminalFromJsonModel = TerminalFromJsonModel.fromJson(response!.data);
      return response!.statusCode!;
    } else {
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
        .get('${Host.host}/api/v1/Termianl/GetTerminals?pageIndex=$pageIndex');

    terminalFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      terminalFromJsonModel = TerminalFromJsonModel.fromJson(response!.data);
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
        .get('${Host.host}/api/v1/Termianl/GetTerminals?pageIndex=$pageIndex');

    terminalFromJsonModel = null;
    if (response!.statusCode == HttpStatus.ok) {
      terminalFromJsonModel = TerminalFromJsonModel.fromJson(response!.data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //removePre

  //search
  //Future<int> seachr()
}
