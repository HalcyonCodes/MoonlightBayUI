import '../Models/ViewModel/order_resource_view_model.dart';

class ServiceUtil {

  //设置选中的itemId
  String? _itemID;
  String? get itemID => _itemID;
  void setItemID(String? id) {
    _itemID = id;
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

  //刷新列表
  Function()? _refreshList;
  Function()? get refreshList => _refreshList;
  void setFuncRefreshList(Function() q) {
    _refreshList = q;
  }

}
