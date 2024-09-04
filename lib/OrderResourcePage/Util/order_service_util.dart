

class OrderServiceUtil {
  //加载resourceId并刷新future
  Function(int)? _loadServiceByResourceID;
  Function(int)? get loadServiceByResourceID => _loadServiceByResourceID;
  void setFuncLoadServiceByResourceID(Function(int)? func) {
    _loadServiceByResourceID = func;
  }


  
}
