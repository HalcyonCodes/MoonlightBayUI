import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

//----页面-----
import '../TerminalPage/terminal_page.dart';
import '../OrderResourcePage/order_resource_page.dart';

//---
Handler terminalPageHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const TerminalPage();
});

Handler orderResourcePageHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const OrderResourcePage();
});
