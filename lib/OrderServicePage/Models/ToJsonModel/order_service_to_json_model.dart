import '../FromJsonModel/order_service_from_json_model.dart';

class OrderServiceToJsonModel {
  Map<String, dynamic> orderService = {};

  OrderServiceToJsonModel();

  OrderServiceToJsonModel.toJsonModel(OrderService model) {
    orderService['id'] = model.id;
    orderService['name'] = model.name;
    orderService['bindingCount'] = model.bindingCount;
    orderService['desc'] = model.desc;
    orderService['workScript'] = model.workScript;
    orderService['resourcess'] = [];
    for (var q in model.resources) {
      orderService['resourcess'].add(q);
    }
  }
}
