

class WorkScriptPickerFromJsonModel {
  String? code;
  String? message;
  WorkScriptPickerFromJsonModelData? data;

  WorkScriptPickerFromJsonModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = WorkScriptPickerFromJsonModelData.fromJson(json['data']);
  }
}

class WorkScriptPickerFromJsonModelData {
  List<WorkScriptPicker>? workScripts;

  WorkScriptPickerFromJsonModelData.fromJson(Map<String, dynamic> json) {
    workScripts = [];
    WorkScriptPicker temp;
    json['orderWorkScripts'].forEach((q) {
      temp = WorkScriptPicker.fromJson(q);
      workScripts!.add(temp);
    });
  }
}

class WorkScriptPicker {
  String? id;
  String? name;
  String? bindingCount;
  String? desc;

  WorkScriptPicker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bindingCount = json['bindingCount'];
    desc = json['desc'];
  }
}
