import 'package:flutter/material.dart';

import '../../../../Config/font.dart';
import '../../../../Config/shadow.dart';

import 'remove_commit_bar.dart';
import '../../../../Config/string.dart';
import '../../Util/edit_util.dart';
import '../../Util/service_util.dart';
import '../../Models/ViewModel/order_service_view_model.dart';

class ServiceRemove extends StatefulWidget {
  final EditUtil editUtil;
  final OrderServiceViewModel orderServiceViewModel;
  final ServiceUtil serviceUtil;
  const ServiceRemove({super.key, required this.editUtil, required this.orderServiceViewModel, required this.serviceUtil});

  @override
  State<ServiceRemove> createState() => _ServiceRemoveState();
}

class _ServiceRemoveState extends State<ServiceRemove> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [KShadow.shadow]),
      width: 658,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ServiceRemoveCommitBar(editUtil: widget.editUtil, orderServiceViewModel: widget.orderServiceViewModel, serviceUtil: widget.serviceUtil,),
          const SizedBox(
            height: 12,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                KString.removeService,
                style: KFont.searchBarInputStyle,
              )),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
