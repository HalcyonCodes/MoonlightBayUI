

class WorkScriptFromJsonModel {
  String? code;
  String? message;
  WorkScriptFromJsonModelData? data;

  WorkScriptFromJsonModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = WorkScriptFromJsonModelData.fromJson(json['data']);
  }
}

class WorkScriptFromJsonModelData {
  List<WorkScript>? workScripts;

  WorkScriptFromJsonModelData.fromJson(Map<String, dynamic> json) {
    workScripts = [];
    WorkScript temp;
    json['orderWorkScripts'].forEach((q) {
      temp = WorkScript.fromJson(q);
      workScripts!.add(temp);
    });
  }
}

class WorkScript {
  String? id;
  String? name;
  String? bindingCount;
  String? desc;
  WorkScript({this.id, this.name, this.bindingCount, this.desc});

  WorkScript.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bindingCount = json['bindingCount'];
    desc = json['desc'];
  }
}
