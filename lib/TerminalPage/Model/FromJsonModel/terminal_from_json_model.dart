class TerminalFromJsonModel {
  late String code;
  late String message;
  late TerminalViewModelData data;
  TerminalFromJsonModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = TerminalViewModelData.fromJson(json['data']);
  }
}

class TerminalViewModelData {
  List<TerminalModel>? terminals = [];

  TerminalViewModelData.fromJson(Map<String, dynamic> json) {
    //terminals = [];
    TerminalModel temp;
    json['terminals'].forEach((v) {
      temp = TerminalModel.fromJson(v);
      terminals!.add(temp);
    });
  }
}

class TerminalModel {
  late String terminalID;
  late String terminalIP;
  late String terminalName;
  late String terminalDesc;
  late int status;

  TerminalModel.fromJson(Map<String, dynamic> json) {
    terminalID = json['id'];
    terminalIP = json['ip'];
    terminalName = json['name'];
    terminalDesc = json['desc'];
    status = json['status'];
  }
}
