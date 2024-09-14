class NavUtil {
  Function(int)? _switchNav;
  Function(int)? get switchNav => _switchNav;
  void setFuncSwitchNav(Function(int) func) {
    _switchNav = func;
  }

  int? _currentNavIndex;
  int? get currentNavIndex => _currentNavIndex;
  void setCurrentNavIndex(int index) {
    _currentNavIndex = index;
    switchNav!(index);
  }

}
