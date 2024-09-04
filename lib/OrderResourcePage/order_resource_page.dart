import 'package:flutter/material.dart';
import './Util/order_service_util.dart';
import '../Config/color.dart';
import '../Config/string.dart';
import './Components/Nav/page_nav.dart';
import './Components/OrderResource/order_resource.dart';
import './Components/OrderService/order_service.dart';
import './Components/Edit/edit.dart';
import './Util/edit_util.dart';
import './Model/ViewModel/resource_view_model.dart';
import './Model/ViewModel/service_view_model.dart';
import './Util/order_resource_util.dart';

class OrderResourcePage extends StatefulWidget {
  const OrderResourcePage({
    super.key,
  });

  @override
  State<OrderResourcePage> createState() => _OrderResourcePageState();
}

class _OrderResourcePageState extends State<OrderResourcePage> {
  EditUtil? editUtil;
  ResourceViewModel? viewModel;
  ServiceViewModel? serviceViewModel;
  OrderResourceUtil? orderResourceUtil;
  OrderServiceUtil? orderServiceUtil;

  @override
  void initState() {
    super.initState();
    editUtil = EditUtil();
    viewModel = ResourceViewModel();
    serviceViewModel = ServiceViewModel();
    orderResourceUtil = OrderResourceUtil();
    orderServiceUtil = OrderServiceUtil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width <= 1920 ? 1920 : 1920,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PageNav(
                    editUtil: editUtil,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  OrderResource(
                    viewModel: viewModel!,
                    orderResourceUtil: orderResourceUtil!,
                    orderServiceUtil: orderServiceUtil!,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  OrderService(
                    viewModel: serviceViewModel!,
                    orderServiceUtil: orderServiceUtil!,
                  )
                  //Edit()
                ],
              ),
            )),
      ),
    );
  }
}
