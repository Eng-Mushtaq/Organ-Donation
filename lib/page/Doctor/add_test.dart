import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/Doctor/doctor_controller.dart';
import '../../widget/textview.dart';

class TestDonorRequest extends StatelessWidget {
  final DoctorController controller = Get.find();

  final String? donor, organ, phone, state, date;
  final int? donId, docId;

  TestDonorRequest(
      {super.key,
      this.donor,
      this.organ,
      this.phone,
      this.state,
      this.date,
      this.donId,
      this.docId});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Text('شاشة إضافة فحص'),
      ),
      body: GetBuilder<DoctorController>(
        builder: (controller) => Center(
            child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return GetBuilder<DoctorController>(
                        builder: (controller) => Column(
                              children: [
                                SizedBox(
                                    width: size.width * .9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        color:
                                            Color.fromARGB(255, 224, 223, 223),
                                      ),
                                      child: Column(
                                        children: [
                                          TextView(
                                            font: ArabicFonts.Cairo,
                                            color: Colors.black,
                                            fontSize: 20,
                                            text: ' المتبرع : ' + donor!,
                                          ),
                                          TextView(
                                            font: ArabicFonts.Cairo,
                                            color: Colors.black,
                                            fontSize: 20,
                                            text: 'العضو : ' + organ!,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // TextView(
                                              //   font: ArabicFonts.Cairo,
                                              //   color: Colors.black,
                                              //   fontSize: 20,
                                              //   text:
                                              //       'هاتف المتبرع : ' + phone??"",
                                              // ),
                                              IconButton(
                                                  onPressed: () {
                                                    launch('tel:/' + phone!);
                                                  },
                                                  icon: Icon(Icons.call)),
                                            ],
                                          ),
                                          TextView(
                                            font: ArabicFonts.Cairo,
                                            color: Colors.black,
                                            fontSize: 20,
                                            text: 'تاريخ الطلب :  ' + date!,
                                          ),
                                          TextView(
                                            font: ArabicFonts.Cairo,
                                            color: Colors.black,
                                            fontSize: 20,
                                            text: 'حالة الطلب : ' + state!,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'موعد الفحص',
                                                    style: TextStyle(
                                                        color: context
                                                            .theme.hintColor,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                        fontSize: 20),
                                                  ),
                                                  Text('${controller.testDate}',
                                                      style: TextStyle(
                                                          color: context
                                                              .theme.hintColor,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.date_range,
                                                  color: Colors.green,
                                                  size: 30.0,
                                                ),
                                                onPressed: () {
                                                  controller.selectTestDate();
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () {
                                                    controller.fileList.clear();
                                                    controller.fileListThumb =
                                                        [];
                                                    controller.update();
                                                  },
                                                ),
                                              ),
                                              const Expanded(
                                                flex: 4,
                                                child: Center(
                                                  child: Text(
                                                    ' ملفات',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: Colors.green,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () {
                                                    controller.pickFiles();
                                                    controller.update();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          controller.fileListThumb == null
                                              ? Row()
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: GridView.count(
                                                    crossAxisCount: 4,
                                                    shrinkWrap: true,
                                                    children: controller
                                                        .fileListThumb!,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Container(
                                  height: size.height * .07,
                                  width: size.width * .5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(colors: [
                                        Color.fromRGBO(143, 148, 251, 1),
                                        Color.fromRGBO(143, 148, 251, .6),
                                      ])),
                                  child: MaterialButton(
                                    onPressed: () {
                                      controller.httpSend(
                                          docId!, donId!, 'desc');
                                    },
                                    child: Center(
                                      child: Text(
                                        "حفظ بيانات الفحص",
                                        style: TextStyle(
                                            color: context.theme.hintColor,
                                            fontFamily: ArabicFonts.Cairo,
                                            package: 'google_fonts_arabic',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ));
                  }),
            ],
          ),
        )),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     controller.httpSend();
      //     controller.update();
      //   },
      //   tooltip: 'Upload File',
      //   child: const Icon(Icons.cloud_upload),
      // ),
    );
  }
}
