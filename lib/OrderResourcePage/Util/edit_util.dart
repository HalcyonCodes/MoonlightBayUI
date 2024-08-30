import 'package:flutter/material.dart';

class EditUtil {
  //nav 工具栏中，点击打开添加编辑框
  Future<void> Function()? _showEdit;
  Future<void> Function()? get showEdit => _showEdit;
  void setFuncShowEdit(Future<void> Function()? func) {
    _showEdit = func;
  }

  //用于移除添加编辑框的方法
  Future<void> Function()? _removeEdit;
  Future<void> Function()? get removeEdit => _removeEdit;
  void setFuncRemoveEdit(Future<void> Function()? func) {
    _removeEdit = func;
  }

  //nav 工具栏中，点击打开移除确定框
  Future<void> Function()? _showRemove;
  Future<void> Function()? get showRemove => _showRemove;
  void setFuncShowRemove(Future<void> Function()? func) {
    _showRemove = func;
  }

  //用于移除确定框
  Future<void> Function()? _removeRemove;
  Future<void> Function()? get removeRemove => _removeRemove;
  void setFuncRemoveRemove(Future<void> Function()? func) {
    _removeRemove = func;
  }



}
