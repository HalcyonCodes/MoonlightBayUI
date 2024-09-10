class OrderServiceFromJsonModel {
  late String? code;
  late String? message;
  late OrderServiceData data;

  OrderServiceFromJsonModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = OrderServiceData.fromJson(json['data']);
  }
}

class OrderServiceData {
  late List<OrderService> orderServices;

  OrderServiceData.fromJson(Map<String, dynamic> json) {
    OrderService temp;
    orderServices = [];
    json['orderServices'].forEach((q) {
      temp = OrderService.fromJson(q);
      orderServices.add(temp);
    });
  }
}

class OrderService {
  late String id;
  late String bindingCount;
  late String name;
  late String desc;
  late List<String> resources;
  late String workScript;

  OrderService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bindingCount = json['bindingCount'];
    name = json['name'];
    desc = json['desc'];
    workScript = json['workScript'];
    resources = [];
    json['resources'].forEach((q) {
      resources.add(q);
    });
  }
}
