import '../FromJsonModel/work_script_from_json_model.dart';





class WorkScriptToJson {
  Map<String, dynamic> workScript = {};

  WorkScriptToJson();

  WorkScriptToJson.toJsonModel(WorkScript model) {
    workScript['id'] = model.id;
    workScript['name'] = model.name;
    workScript['desc'] = model.desc;
    workScript['bindingCount'] = model.bindingCount;
  }
}
