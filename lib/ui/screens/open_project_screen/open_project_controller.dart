import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../api_services/repo.dart';
import '../../../modals/project_res.dart';
import '../../../model_class/project_model.dart';

class OpenProjectController extends GetxController {
  TextEditingController dateController = TextEditingController();
  String fileName = "";

  String createdOn = "2025-02-25T05:07:14.337787"; // Sample Date
  var projects = <Projects>[].obs;

  static void showTopMessage(BuildContext context, String message) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50, // Adjust this value to change the position of the popup
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // Remove the message after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  String formatCost(String value) {
    if (value.isEmpty) return ''; // Empty string return karein instead of "0"

    double? number = double.tryParse(value.replaceAll(',', ''));
    if (number == null) return '';

    final formatter = NumberFormat('#,##0', 'en_US');
    return formatter.format(number);
  }


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
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  var materialsList = <MaterialModel>[].obs; //  Define as RxList

  void addMaterial(String name, String cost, String dueDate) {
    materialsList.add(MaterialModel(
      name: name,
      cost: cost,
      dueDate: dueDate,
      status: "In-Progress",
    ));
  }

  void showAddMaterialPopup(BuildContext context) {
    TextEditingController materialNameController = TextEditingController();
    TextEditingController costController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    fileName = "";

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeader(context),
                      Divider(color: Colors.grey.shade300),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            textFieldWidget("Material Name",
                                controller: materialNameController),
                            SizedBox(height: 10),
                            textFieldWidget("Cost of Material",
                                controller: costController, isCostField: true),
                            SizedBox(height: 5),
                            _buildCostInfo(),
                            SizedBox(height: 16),
                            textFieldWidget("Requested Payment Due Date",
                                isDateField: true, controller: dateController),
                            SizedBox(height: 10),
                            _buildUploadButton(context, setModalState),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(fileName),
                            ),
                            SizedBox(height: 15),
                            _buildContinueButton(
                                context,
                                materialNameController,
                                costController,
                                dateController),
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

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Add New Material",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700, fontSize: 16)),
          IconButton(
            icon: Icon(Icons.close, color: Colors.grey),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCostInfo() {
    return Container(
      height: 25,
      decoration: BoxDecoration(
        color: Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(CupertinoIcons.exclamationmark_circle,
                color: Color(0xFF1E40AF), size: 13.0),
          ),
          Expanded(
            child: Text(
              "Inclusive of GST and shipping charges",
              style: TextStyle(
                  color: Color(0xFF1E40AF),
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context, Function setModalState) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xFFF0EEF6), borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: () {
          // pickAndUploadPDF(context, setModalState);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/upload_attach.svg'),
            SizedBox(width: 5),
            Text(
              "Upload Supplier Quote",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF603EA4)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context, TextEditingController name,
      TextEditingController cost, TextEditingController date) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (name.text.trim().isEmpty ||
              cost.text.trim().isEmpty ||
              date.text.trim().isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Please fill all fields"),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }

          final controller = Get.find<OpenProjectController>();
          controller.addMaterial(
              name.text.trim(), cost.text.trim(), date.text.trim());

          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF603EA4),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          "Continue",
          style: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  Widget textFieldWidget(String label,
      {bool isDateField = false,
      TextEditingController? controller,
      bool isCostField = false}) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        readOnly: isDateField,
        keyboardType: isCostField ? TextInputType.number : TextInputType.text,
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
        onChanged: isCostField
            ? (value) {
                String formattedValue = formatCost(value);
                if (controller?.text != formattedValue) {
                  controller?.value = TextEditingValue(
                    text: formattedValue,
                    selection:
                        TextSelection.collapsed(offset: formattedValue.length),
                  );
                }
              }
            : null,
        decoration: InputDecoration(
          labelText: label,
          prefixText: isCostField ? '₹ ' : null, // Rupee sign added
          suffixIcon: isDateField
              ? Padding(
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    'assets/images/date_image.svg',
                    height: 16,
                    width: 16,
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
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
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
          backgroundColor: Colors.red,
          colorText: Colors.white);
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
