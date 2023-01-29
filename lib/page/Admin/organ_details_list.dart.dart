import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organdonation/controller/Admin/admin_controller.dart';

import '../../widget/dissmiss.dart';
import '../../widget/request_card.dart';

class OrganDetailsList extends StatelessWidget {
  final AdminController patientRequestController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .03),
        child: GetBuilder<AdminController>(
          builder: (patientRequestController) => Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: patientRequestController.allRequest.length,
                itemBuilder: (context, i) {
                  final item = patientRequestController.allRequest[i];

                  return Center(
                    child: DismissibleWidget(
                      item: item,
                      child: RequestCard(size, item, context, true),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
