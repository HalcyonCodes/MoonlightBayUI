
class OrderResourceUtil {
  //清空所有选中的方法
  final List<Function()> _setCardUnSelect = [];
  List<Function()> get setCardUnSelect => _setCardUnSelect;
  void addFuncSetCardUnSelect(Function() func) {
    _setCardUnSelect.add(func);
  }

  void removeFuncSetCardUnSelect(Function() func) {
    _setCardUnSelect.remove(func);
  }
}
