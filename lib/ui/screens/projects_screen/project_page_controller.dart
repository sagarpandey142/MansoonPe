import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projects/ui/screens/home_screens/home_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_services/repo.dart';
import '../../../modals/project_res.dart';
import '../home_screens/home_page_controller.dart';

class ProjectPageController extends GetxController {
  TextEditingController dateController = TextEditingController();

  String createdOn = "2025-02-25T05:07:14.337787"; // Sample Date
  var projects = <Projects>[].obs;
  getProjects() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      // var uid = prefs.getString("id") ?? '';
      // var mob= prefs.getString("phone") ?? '';
      Repository repo = Repository(token: token);
      var res = await repo.getProjects({});
      debugPrint("VskingProfileRes:>>>$res");
      if (res.status == 200) {
        projects.value = res.data!.projects!;
      }
    } catch (e) {
      debugPrint("Error: $e");
      Get.snackbar("Error", "Something went wrong!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void showAddMaterialPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // Important for keyboard handling
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom:
                    MediaQuery.of(context).viewInsets.bottom, // Push content up
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20), // Extra padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize:
                        MainAxisSize.min, // Important to wrap content correctly
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Add New Material",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700, fontSize: 16)),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            textFieldWidget("Material Name"),
                            SizedBox(height: 10),
                            textFieldWidget("Cost of Material"),
                            SizedBox(height: 5),
                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xFFEFF6FF),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      CupertinoIcons.exclamationmark_circle,
                                      color: Color(0xFF1E40AF),
                                      size: 13.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Inclusive of GST and shipping charges",
                                      style: TextStyle(
                                        color: Color(0xFF1E40AF),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            textFieldWidget("Requested Payment Due Date",
                                isDateField: true, controller: dateController),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFF0EEF6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/upload_attach.svg'),
                                    SizedBox(width: 5),
                                    Text(
                                      "Upload Supplier Quote",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF603EA4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Get.to(() =>
                                  //     OpenProjectScreen()); // Correct way to navigate
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF603EA4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Continue",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showProjectPopup(BuildContext context, Projects project) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Popup",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.chevron_left_outlined,
                              size: 35, color: Color(0x99000000)),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          "${project.name}",
                          style: TextStyle(
                            color: Color(0xCC000000),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Get.find<ProjectPageController>()
                            .showAddMaterialPopup(Get.context!);
                      },
                      child: Text(
                        "+ Add new material",
                        style: TextStyle(
                          color: Color(0xCC603EA4),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.grey.shade300,thickness: 2,),
                // Purchase Details
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Purchases: ${project.budget}",
                              style: TextStyle(
                                  color: Color(0xFF363F72),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          TextButton(
                            onPressed: () {
                              downloadPDF(project);
                            },
                            child: Text("Download Contract",
                                style: TextStyle(
                                    color: Color(0xFF603EA4),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10)),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Created on: ",
                              style: const TextStyle(
                                color: Color(0x99000000),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: HomePageController.formatDate(createdOn), // Calling controller function
                                  style: const TextStyle(
                                    color: Color(0xCC000000),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Status: ",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0x99000000)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(
                                project.status == "IN_REVIEW"
                                    ? 0xFFFFF2CC // Even lighter orange
                                    : project.status == "ACTIVE"
                                    ? 0xFFEAF7EE // Even lighter green
                                    : 0xFFFDECEA, // Even lighter red
                              ),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 0.7, // Thinner border
                                color: Color(
                                  project.status == "IN_REVIEW"
                                      ? 0xFFFFD699 // Lighter orange border
                                      : project.status == "ACTIVE"
                                      ? 0xFFA8E6B5 // Lighter green border
                                      : 0xFFF5A8A8, // Lighter red border
                                ),
                              ),
                            ),
                            child: Text(
                              project.status == "IN_REVIEW"
                                  ? "In-review"
                                  : project.status == "ACTIVE"
                                  ? "Active"
                                  : "Inactive", // Adjust as needed
                              style: GoogleFonts.poppins(
                                color: Color(
                                  project.status == "IN_REVIEW"
                                      ? 0xFFB54708
                                      : project.status == "ACTIVE"
                                      ? 0xFF28A745
                                      : 0xFFDC3545,
                                ),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Text.rich(
                        TextSpan(
                          text: "Assigned Credit: ",
                          style: const TextStyle(
                            color: Color(0x99000000),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "₹ ${NumberFormat('#,##,###').format(project.budget)}",
                              style: const TextStyle(
                                color: Color(0xCC000000),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8), // Consistent spacing

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Consumed: ",
                              style: const TextStyle(
                                color: Color(0x99000000),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: "₹ ${NumberFormat('#,##,###').format(project.budget)}",
                                  style: const TextStyle(
                                    color: Color(0xCC000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Credit left: ",
                              style: const TextStyle(
                                color: Color(0x99000000),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: "₹ ${NumberFormat('#,##,###').format(project.budget)}",
                                  style: const TextStyle(
                                    color: Color(0xCC000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 1,),

                Spacer(),
                // Empty State
                Column(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/order_file.svg',
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("You haven't requested any quote yet.",
                        style: TextStyle(
                          color: Color(0x66000000),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        )),
                  ],
                ),
                Spacer(),
                // Bottom Buttons

                Divider(color: Colors.grey.shade300,),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePageScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                            ),
                            minimumSize: const Size(double.infinity, 50), // Increased height
                            side: BorderSide(color: Colors.grey[300]!, width: 1.3), // Grey border
                          ),
                          child: const Text(
                            "Go to Homepage",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0x99000000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.find<ProjectPageController>()
                                .showAddMaterialPopup(Get.context!);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF603EA4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Add new material",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget textFieldWidget(String label,
      {bool isDateField = false, TextEditingController? controller}) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        readOnly: isDateField,
        onTap: isDateField
            ? () async {
                DateTime? pickedDate = await showDatePicker(
                  context: Get.context!,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  controller?.text =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                }
              }
            : null,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: isDateField
              ? Padding(
            padding: const EdgeInsets.all(13), // Add padding to keep spacing
            child: SvgPicture.asset(
              'assets/images/date_image.svg',
              height: 16, // Decrease height
              width: 16, // Decrease width
            ),
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          labelStyle: TextStyle(
            color: Color(0x99000000),
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
        ),
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }

  Future<void> downloadPDF(Projects project) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      // var uid = prefs.getString("id") ?? '';
      // var mob= prefs.getString("phone") ?? '';
      Repository repo = Repository(token: token);
      var res = await repo.downloadApi("${project.contractFile}", {});
      debugPrint("VskingProfileRes:>>>$res");
      if (res.status == 200) {
        String base64String = res.data!.fileBytes!;
        decodeAndSaveBase64(base64String, "${project.contractFile}");
      }
    } catch (e) {
      debugPrint("Error: $e");
      Get.snackbar("Error", "Something went wrong!",
          snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> decodeAndSaveBase64(String base64String, String fileName) async {
    try {
      // Request storage permission (for Android)
      if (Platform.isAndroid) {
        await Permission.storage.request();
      }

      // Decode Base64 string
      Uint8List bytes = base64Decode(base64String);

      // Get the app's documents directory
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/$fileName';

      // Save file
      File file = File(filePath);
      await file.writeAsBytes(bytes);

      // Share or notify user
      print("File saved at: $filePath");
      // Share.shareXFiles([XFile(filePath)], text: "Here is your downloaded file");
      await OpenFilex.open(filePath);
    } catch (e) {
      print("Error saving file: $e");
    }
  }
}
