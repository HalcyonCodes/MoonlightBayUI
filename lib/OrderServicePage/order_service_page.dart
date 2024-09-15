
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
import './Util/resource_util.dart';
import './Components/OrderResourcePicker/order_service_resource_picker.dart';
import './Models/ViewModel/order_resource_picker_view_model.dart';
import 'Util/resource_picker_util.dart';
import 'Models/ViewModel/work_script_view_model.dart';
import './Util/work_script_util.dart';
import './Util/work_script_picker_util.dart';
import './Components/WorkScriptPicker/work_script_picker.dart';
import './Models/ViewModel/work_script_picker_view_model.dart';
import './Util/edit_util.dart';
import './Util/service_util.dart';

class OrderServicePage extends StatefulWidget {
  const OrderServicePage({super.key});

  @override
  State<OrderServicePage> createState() => _OrderServicePageState();
}

class _OrderServicePageState extends State<OrderServicePage> {
  OrderServiceViewModel? viewModel;
  OrderResourceViewModel? resourceViewModel;
  OrderResourcePickerViewModel? resourcePickerViewModel;
  ResourceUtil? resourceUtil;
  ResourcePickerUtil? resourcePickerUtil;
  WorkScriptViewModel? workScriptViewModel;
  WorkScriptUtil? workScriptUtil;
  WorkScriptPickertUtil? workScriptPickerUtil;
  WorkScriptPickerViewModel? workScriptPickerViewModel;
  ServiceUtil? serviceUtil;
  EditUtil? editUtil1;
  EditUtil? editUtil2;
  EditUtil? editUtil3;


  int navPage = 0;
  NavUtil? navUtil;

  @override
  void initState() {
    super.initState();
    viewModel = OrderServiceViewModel();
    navUtil = NavUtil();
    resourceUtil = ResourceUtil();
    resourceViewModel = OrderResourceViewModel();
    resourcePickerViewModel = OrderResourcePickerViewModel();
    resourcePickerUtil = ResourcePickerUtil();
    workScriptViewModel = WorkScriptViewModel();
    workScriptUtil = WorkScriptUtil();
    workScriptPickerUtil = WorkScriptPickertUtil();
    workScriptPickerViewModel = WorkScriptPickerViewModel();
    editUtil1 = EditUtil();
    editUtil2 = EditUtil();
    editUtil3 = EditUtil();
    serviceUtil = ServiceUtil();
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
                  PageNav(
                    navUtil: navUtil!, resourceUtil: resourceUtil, 
                    resourcePickerUtil: resourcePickerUtil, 
                    workScriptUtil: workScriptUtil,
                    workScriptPickertUtil: workScriptPickerUtil!, editUtil1: editUtil1, editUtil2: editUtil2, editUtil3: editUtil3,
                    orderServiceViewModel: viewModel!, orderResourceViewModel: resourceViewModel!, workScriptViewModel: workScriptViewModel!,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  OrderService(
                    viewModel: viewModel!,
                    serviceUtil: serviceUtil!, resourceViewModel: resourceViewModel!, resourceUtil: resourceUtil!, navUtil: navUtil!, workScriptUtil: workScriptUtil!, workScriptViewModel: workScriptViewModel!,
                    
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  navPage == 1
                      ? OrderServiceResource(
                          title: KString.addOrderResource,
                          viewModel: resourceViewModel,
                          resourceUtil: resourceUtil,
                          
                        )
                      : navPage == 2
                          ?  WorkScript(viewModel: workScriptViewModel!,workScriptUtil: workScriptUtil,)
                          : const SizedBox(),
                  const SizedBox(
                          width: 24,
                        ),

                  navPage == 1
                      ? OrderServiceResourcePicker(
                        resourceUtil: resourceUtil!,
                        title: KString.allServiceResource, viewModel: resourcePickerViewModel, resourcePickerUtil: resourcePickerUtil)
                      : 
                  //navPage == 2 ? WorkScript(viewModel: workScriptViewModel!, workScriptUtil: workScriptUtil,) : const SizedBox()
                  navPage == 2 ?  WorkScriptPicker(viewModel: workScriptPickerViewModel!, workScriptUtil: workScriptPickerUtil!,) : const SizedBox(

                  )
                ],
              ),
            )),
      ),
    );
  }

 
}
