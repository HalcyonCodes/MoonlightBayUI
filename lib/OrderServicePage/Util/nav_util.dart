class NavUtil {
  Function(int)? _switchNav;
  Function(int)? get switchNav => _switchNav;
  void setFuncSwitchNav(Function(int) func) {
    _switchNav = func;
  }

}
