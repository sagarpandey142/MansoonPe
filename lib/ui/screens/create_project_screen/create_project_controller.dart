import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/modals/create_project_req.dart';
import 'package:projects/ui/screens/projects_screen/project_page_screen.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_services/repo.dart';

class CreateProjectController extends ChangeNotifier {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectCostController = TextEditingController();
  TextEditingController projectLocationController = TextEditingController();
  String fileName = "";

  void showCreateProjectBottomSheet(BuildContext context) {
    // Reset controllers and fileName before showing the bottom sheet
    projectNameController.clear();
    projectCostController.clear();
    projectLocationController.clear();
    fileName = "";

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
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, // Adjust for keyboard
              ),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Create your first project",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            textFieldWidget("Enter Project Name",
                                projectNameController), // Down arrow
                            SizedBox(height: 10),
                            textFieldWidget(
                                "Overall Project Cost", projectCostController,
                                isNumeric: true,
                                prefixText: "₹ "), // Dollar sign & numbers only
                            SizedBox(height: 10),
                            textFieldWidget("Enter Location",
                                projectLocationController), // Down arrow
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFF0EEF6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              pickAndUploadPDF(context, setModalState);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/upload_attach.svg'),
                                SizedBox(width: 5),
                                Text(
                                  "Upload Contract",
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(fileName),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              createProject(context);
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
                      ),
                      SizedBox(height: 20),
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

  createProject(context) async {
    if (projectNameController.text.isEmpty) {
      showSnackMessage(context, "Please fill project name");
    } else if (projectCostController.text.isEmpty) {
      showSnackMessage(context, "Please fill project cost");
    } else if (projectLocationController.text.isEmpty) {
      showSnackMessage(context, "Please fill project location.");
    } else if (fileName.isEmpty) {
      showSnackMessage(context, "Please upload contract in pdf.");
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';

      try {
        CreateProjectReq req = CreateProjectReq();
        req.name = projectNameController.text;
        req.budget = projectCostController.text;
        req.location = projectLocationController.text;
        req.contractFile = fileName;
        Repository repo = Repository(token: token);
        var res = await repo.createProject(req);

        if (res.status == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Project Successfully Created!"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
          await prefs.setBool("is_project_created", true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProjectPageScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Something went wrong!"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong!"),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> pickAndUploadPDF(context, setModalState) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      uploadPDF(file, context, setModalState);
      print("FileData:${file.path}");
    } else {
      print("No file selected");
    }
  }

  Future<void> uploadPDF(File file, context, setModalState) async {
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: DioMediaType("application", "pdf"),
        ),
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token").toString();

      Repository repo = Repository(token: token, isRequestTypeMultipart: true);
      var response = await repo.uploadFile(formData);
      if (response.status == 200) {
        print("Upload Successful: ${response.data!.fileName!}");

        setModalState(() {
          fileName = response.data!.fileName!;
          notifyListeners();
        });
      } else {
        print("Upload failed with status: ${response.status}");
        showSnackMessage(context, "${response.message}");
      }
    } catch (e) {
      print("Error uploading file: ${e.toString()}");
      showSnackMessage(context, "Please check file size.");
    }
  }

  void showSnackMessage(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10, // Positioning at top
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove the overlay after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  Widget textFieldWidget(String label, TextEditingController controller,
      {bool isNumeric = false, String? prefixText}) {
    return SizedBox(
      height: 60, // Fixed height to prevent shrinking
      child: TextFormField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        inputFormatters:
            isNumeric ? [FilteringTextInputFormatter.digitsOnly] : [],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return null; // No extra space added for error
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
          labelStyle: TextStyle(
            color: Color(0x99000000),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          prefixText: prefixText,
          prefixStyle: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: TextStyle(
          color: Color(0xCC000000),
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
