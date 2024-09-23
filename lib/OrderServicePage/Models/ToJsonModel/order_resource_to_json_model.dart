import '../FromJsonModel/order_resource_from_json_model.dart';





class SettingOrderResourceToJson {
  Map<String, dynamic> json = {};

  SettingOrderResourceToJson();

  SettingOrderResourceToJson.toJsonModel(List<OrderResource> model) {
    json['orderResources'] = [];
    model.forEach((q) {
      json['orderResources'].add(OrderResourceToJson.toJsonModel(q));
    });
  }
}

class OrderResourceToJson {
  Map<String, dynamic> orderResource = {};

  OrderResourceToJson();

  OrderResourceToJson.toJsonModel(OrderResource model) {
    orderResource['id'] = model.id;
    orderResource['bindingCount'] = model.bindingCount;
    orderResource['desc'] = model.desc;
    orderResource['name'] = model.name;
  }
}
