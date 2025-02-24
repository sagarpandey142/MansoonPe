import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../api_services/repo.dart';
import '../../../modals/create_project_req.dart';
import '../../../modals/create_project_res.dart';
import '../projects_screen/project_page_screen.dart';

class CreateProjectController extends GetxController {
  var selectedProject = RxnString();
  var selectedLocation = RxnString();
  TextEditingController costController = TextEditingController();

  final List<String> projectOptions = [
    "Project 1",
    "Project 2",
    "Project 3",
    "Project 4",
    "Project 5",
    "Project 6",
    "Project 7",
    "Project 8",
    "Project 9",
    "Project 10"
  ];

  final List<String> locationOptions = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Chennai",
    "Kolkata",
    "Pune",
    "Ahmedabad",
    "Jaipur",
    "Lucknow"
  ];

  void formatCost(String value) {
    String formattedValue =
        NumberFormat("#,##0").format(int.tryParse(value) ?? 0);
    costController.value = TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }

  @override
  void onClose() {
    costController.dispose();
    super.onClose();
  }

  final Repository _repository = Repository();

  var isLoading = false.obs;
  Rx<File?> selectedFile = Rx<File?>(null);

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Only allow PDF files
    );

    if (result != null && result.files.single.path != null) {
      File pickedFile = File(result.files.single.path!);

      // Check file size (limit to 5MB)
      if (pickedFile.lengthSync() > 5 * 1024 * 1024) {
        Get.snackbar("Error", "File size must be less than 5MB.");
        return;
      }

      selectedFile.value = pickedFile;
      Get.snackbar("Success", "PDF file selected successfully.");
    } else {
      Get.snackbar("Error", "No file selected.");
    }
  }

  Future<void> uploadContract() async {
    if (selectedFile.value == null) {
      Get.snackbar("Error", "Please select a PDF file first.");
      return;
    }

    try {
      isLoading.value = true;

      CreateProjectReq request =
          CreateProjectReq(uploadedFile: selectedFile.value);
      CreateProjectRes response = await _repository.createProject(request);

      if (response.success) {
        Get.snackbar("Success", response.message);
      } else {
        Get.snackbar("Error", response.message);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong!");
    } finally {
      isLoading.value = false;
    }
  }

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
                            dropdownWidget("Select Project", selectedProject,
                                projectOptions),
                            SizedBox(height: 10),
                            costInputField(),
                            SizedBox(height: 10),
                            dropdownWidget("Select Location", selectedLocation,
                                locationOptions),
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
                            onPressed: () async {
                              final controller =
                                  Get.find<CreateProjectController>();

                              await controller
                                  .pickFile(); // Pehle file picker open hoga

                              if (controller.selectedFile.value != null) {
                                await controller
                                    .uploadContract(); // Agar file select ho gayi toh upload hoga
                              }
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
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => ProjectPageScreen());
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

  Widget dropdownWidget(
      String label, RxnString selectedValue, List<String> options) {
    return Obx(() => SizedBox(
          height: 50,
          child: DropdownButtonFormField<String>(
            value: selectedValue.value,
            decoration: InputDecoration(
              labelText: label,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (value) => selectedValue.value = value,
          ),
        ));
  }

  Widget costInputField() {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: costController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: "Overall Project Cost",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixText: "\$ ",
        ),
        onChanged: formatCost,
      ),
    );
  }
}
