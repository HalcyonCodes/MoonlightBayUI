

import '../Models/FromJsonModel/work_script_from_json_model.dart';

class WorkScriptPickertUtil {


    //设置选中的itemIndex
  int? _itemIndex;
  int? get itemIndex => _itemIndex;
  void setItemIndex(int? index) {
    _itemIndex = index;
  }

  //设置单选
  final List<Function()>? _setItemUnSelect = [];
  List<Function()>? get setItemUnSelect => _setItemUnSelect;
  void addFuncSetItemUnSelect(Function() q) {
    _setItemUnSelect!.add(q);
  }

  void removFuncSetItemUnSelect(Function() q) {
    _setItemUnSelect!.remove(q);

  }

  //设置单选
  final List<Function()>? _setItemSelect = [];
  List<Function()>? get setItemSelect => _setItemSelect;
  void addFuncSetItemSelect(Function() q) {
    _setItemSelect!.add(q);
  }

  void removFuncSetItemSelect(Function() q) {
    _setItemSelect!.remove(q);
  }


    //移除item
  Function()? _removeItem;
  Function()? get removeItem => _removeItem;
  void setFuncRemoveItem(Function()? q) {
    _removeItem = q;
  }

  //移入item
  Function? _addItem;
  Function? get addItem => _addItem;
  void setFuncAddItem(Function? q) {
    _addItem = q;
  }

   //设置item属性

  WorkScript? workScript;
  void  setWorkScript(String? id, String? name, String? desc, String? bindingCount){
    workScript = WorkScript(id: id, name: name, desc: desc, bindingCount: bindingCount);
  }

  //刷新future列表
  Function()? _refreshFuture;
  Function()? get refreshFuture => _refreshFuture;
  void setFuncRefreshFuture(Function()? q) {
    _refreshFuture = q;
  }



}