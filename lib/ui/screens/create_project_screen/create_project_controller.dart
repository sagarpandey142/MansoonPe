import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
  String fileName="";
  void showCreateProjectBottomSheet(BuildContext context) {
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
                bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
              ),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                                fontWeight: FontWeight.bold,
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
                            textFieldWidget("Enter Project Name",projectNameController),
                            SizedBox(height: 10),
                            textFieldWidget("Overall Project Cost",projectCostController),
                            SizedBox(height: 10),
                            textFieldWidget("Enter Location",projectLocationController),
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
                                SvgPicture.asset('assets/images/upload_attach.svg'),
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
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(fileName),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Get.to(() => ProjectPageScreen());
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
    if(projectNameController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill project name"),
          backgroundColor: Colors.grey,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }else if(projectCostController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill project cost"),
          backgroundColor: Colors.grey,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }else if(projectNameController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill project location"),
          backgroundColor: Colors.grey,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }else if(fileName.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please upload contract in pdf."),
          backgroundColor: Colors.grey,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token").toString();

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
              backgroundColor: Colors.grey,
              behavior: SnackBarBehavior.floating,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProjectPageScreen()),
          );
          // Get.to(() => ProjectPageScreen());
        } else {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Something went wrong!"),
              backgroundColor: Colors.grey,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Something went wrong!"),
            backgroundColor: Colors.grey,
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
      File file =  File(result.files.single.path!);
      uploadPDF(file,context, setModalState);
      print("FileData:${file.path}");
    } else {
      print("No file selected");
    }
  }

  Future<void> uploadPDF(File file,context, setModalState) async {

    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: DioMediaType("application","pdf"),
        ),
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token").toString();

      Repository repo = Repository(token: token,isRequestTypeMultipart: true);
      var response = await repo.uploadFile(formData);
      if (response.status == 200) {
        print("Upload Successful: ${response.data!.fileName!}");


        setModalState((){
          fileName=response.data!.fileName!;
          notifyListeners();
        });
      } else {
        print("Upload failed with status: ${response.status}");
      }
    } catch (e) {
      print("Error uploading file: $e");
    }
  }

  Widget textFieldWidget(String label, TextEditingController controller) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300), // Set gray border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300), // Set gray border when focused
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300), // Set gray border for normal state
          ),
          labelStyle: TextStyle(color: Color(0xCC000000),
              fontWeight: FontWeight.w400,
              fontSize: 14
          ),
        ),
        style: TextStyle(color: Colors.black), // Changed text color for visibility
      ),
    );
  }

}