



class ChannelFromJsonModel {
  late String? code;
  late String? message;
  late ChannelViewModelData data;

  ChannelFromJsonModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = ChannelViewModelData.fromJson(json['data']);
  }
}



class ChannelViewModelData {
  late List<TerminalOrderModel> channel = [];

  ChannelViewModelData.fromJson(Map<String, dynamic> json) {
    TerminalOrderModel temp;
    json['channel'].forEach((v) {
      temp = TerminalOrderModel.fromJson(v);
      channel.add(temp);
    });
  }
}

class TerminalOrderModel {
  late String? id;
  late String? date;
  late String? time;
  late String? name;
  late List<TerminalOrderResourceModel>? resource;

  TerminalOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    name = json['name'];
    resource = [];
    TerminalOrderResourceModel temp;
    json['resource'].forEach((v) {
      temp = TerminalOrderResourceModel.fromJson(v);
      resource!.add(temp);
    });
  }
}

class TerminalOrderResourceModel {
  late String? resourceName;
  late String? resourceValue;

  TerminalOrderResourceModel.fromJson(Map<String, dynamic> json) {
    resourceName = json.keys.first;
    resourceValue = json[resourceName];
  }
}
