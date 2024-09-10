
class OrderResourceFromJsonModel {
  late String? code;
  late String? message;
  late OrderResourceData data;

  OrderResourceFromJsonModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = OrderResourceData.fromJson(json['data']);
  }
}

class OrderResourceData {
  late List<OrderResource>? orderResources;

  OrderResourceData.fromJson(Map<String, dynamic> json) {
    orderResources = [];
    OrderResource temp;
    json['orderResources'].forEach((q) {
      temp = OrderResource.fromJson(q);
      orderResources!.add(temp);
    });
  }
}

class OrderResource {
  late String? id;
  late String? bindingCount;
  late String? desc;
  late String? name;

  OrderResource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bindingCount = json['bindingCount'];
    desc = json['desc'];
    name = json['name'];
  }
}
