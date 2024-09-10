import 'package:flutter/material.dart';
import '../Config/color.dart';
import '../Config/string.dart';
import './Components/Nav/page_nav.dart';
import './Components/OrderService/order_service.dart';
import './Components/WorkScript/work_script.dart';
import './Models/ViewModel/order_service_view_model.dart';
import './Util/nav_util.dart';
import './Components/OrderResource/order_service_resource.dart';
import './Models/ViewModel/order_resource_view_model.dart';

class OrderServicePage extends StatefulWidget {
  const OrderServicePage({super.key});

  @override
  State<OrderServicePage> createState() => _OrderServicePageState();
}

class _OrderServicePageState extends State<OrderServicePage> {
  OrderServiceViewModel? viewModel;
  ResourceViewModel? resourceViewModel;

  int navPage = 0;
  NavUtil? navUtil;

  @override
  void initState() {
    super.initState();
    viewModel = OrderServiceViewModel();
    navUtil = NavUtil();
    //注册
    navUtil!.setFuncSwitchNav(switchNav);
  }

  void switchNav(int page) {
    navPage = page;
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
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
                  PageNav(navUtil: navUtil!,),
                  const SizedBox(
                    width: 24,
                  ),
                  OrderService(
                    viewModel: viewModel!,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                    navPage == 1 ? OrderServiceResource(title: KString.addOrderResource, viewModel: resourceViewModel) :
                    navPage == 2 ? WorkScript() : SizedBox(),

                    navPage == 1 ? SizedBox(width: 24,):
                    navPage == 2 ? SizedBox(width: 24,): SizedBox(),
                  
                    //OrderServiceResource(title: KString.allOrderServiceResource)
                    navPage == 2 ? WorkScript(): SizedBox()
                  
                ],
              ),
            )),
      ),
    );
  }
}
