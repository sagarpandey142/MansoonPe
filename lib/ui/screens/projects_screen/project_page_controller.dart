import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_services/repo.dart';
import '../../../modals/project_res.dart';

class ProjectPageController extends GetxController {
  TextEditingController dateController = TextEditingController();

  String createdOn = "2025-02-25T05:07:14.337787"; // Sample Date
  var projects = <Projects>[].obs;

  // Fetch projects from API
  getProjects() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      Repository repo = Repository(token: token);
      var res = await repo.getProjects({});
      debugPrint("VskingProfileRes:>>>$res");
      print(projects.value);
      if (res.status == 200) {
        projects.value = res.data!.projects!;
      }
    } catch (e) {
      debugPrint("Error: $e");
      // Get.snackbar("Error", "Something went wrong!",
      //     snackPosition: SnackPosition.TOP,
      //     backgroundColor: Colors.red, colorText: Colors.white);
    }
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