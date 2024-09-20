import 'package:flutter/material.dart';

import 'dart:js' as js;

class JwtManager {
  static void setJwtCookie(String jwt, int days) {
    // 调用JavaScript函数保存JWT令牌
    js.context.callMethod('setCookie', ['jwt', jwt, days]);
  }

  static void test() {
    // 调用JavaScript函数保存JWT令牌
    js.context.callMethod('test', ['test']);
  }

  static String getJwtCookie() {
    // 调用JavaScript函数保存JWT令牌
    String c = js.context.callMethod('getCookie', ['jwt']);
    return c;
  }
}
