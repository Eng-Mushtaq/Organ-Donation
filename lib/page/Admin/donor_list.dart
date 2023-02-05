import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organdonation/controller/Admin/admin_controller.dart';

import '../../widget/dissmiss.dart';
import '../../widget/donor_req_card_admin.dart';
import '../../widget/donor_request_card2.dart';
import '../../widget/request_card.dart';

class DonorRequestListAdmni extends StatelessWidget {
  final AdminController donorRequestController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .03),
        child: GetBuilder<AdminController>(
          builder: (donorRequestController) => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: donorRequestController.allDonorRequest.length,
                  itemBuilder: (context, i) {
                    final item = donorRequestController.allDonorRequest[i];
                    return Center(
                      child: DismissibleWidget(
                        item: item,
                        child: donorRequestCardAdmin(size, item, context, true),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
