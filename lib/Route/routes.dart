import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './handle_route.dart';

class Routes {
  static String root = '/';
  static String terminalPage = '/TerminalPage';
  static String orderResourcePage = '/OrderResourcePage';
  static String orderServicePage = '/OrderServicePage';

  //---------
  static void configureRotes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> para) {
      print('Error ==> Route Was Not Found!');
      return null;
    });

    //路由配置
    router.define(root, handler: terminalPageHandle);
    router.define(terminalPage, handler: terminalPageHandle);
    router.define(orderResourcePage, handler: orderResourcePageHandle);
    router.define(orderServicePage, handler: orderServicePageHandle);
  }
}
