import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projects/modals/project_res.dart';
import 'package:projects/ui/screens/create_project_screen/create_project_screen.dart';
import 'package:projects/ui/screens/home_screens/home_page_controller.dart';
import 'package:projects/ui/screens/projects_screen/project_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_services/repo.dart';
import '../../../utils/custom_colour.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';
import '../create_project_screen/create_project_controller.dart';
import '../profile_screen/profile_page_screen.dart';
import '../projects_screen/project_page_controller.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final ProjectPageController controller = Get.put(ProjectPageController());

  String createdOn = "2025-02-25T05:07:14.337787"; // Sample Date
  int _currentIndex = 0;
  List<Projects> projects = [];
  @override
  void initState() {
    super.initState();
    getProjects();
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
        setState(() {
          projects = res.data!.projects!;
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
      Get.snackbar("Error", "Something went wrong!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          CustomColor.primaryColor,
                          CustomColor.secondaryColor
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "MasonPe.",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to ProfilePageScreen
                        Get.to(() => ProfilePageScreen());
                      },
                      child: SvgPicture.asset("assets/images/menu_vector.svg"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Container(
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
                      child: Icon(
                        CupertinoIcons.exclamationmark_circle,
                        color: Color(0xFF1E40AF),
                        size: 13.0, // Adjust size to fit within the height
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "We will allot credit limit in 24-48 hrs post profile evaluation",
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
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/home_regi_container.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Distributes content evenly
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Credit Left",
                            style: TextStyle(
                                color: Color(0x99FFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        SizedBox(height: 4),
                        Text(
                          "₹ 0",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                color: Colors.black, //  Black shadow
                                offset: Offset(0, 2), //  Move shadow downward
                                blurRadius: 8, //  Smooth effect
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Devesh Gupta",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Limit:",
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  TextSpan(
                                      text: " ₹ 0",
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ],
                              ),
                            ),
                            Text(
                              "MasonPe.",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Projects",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xCC000000),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => ProjectPageScreen());
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4600F2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 3),
            projects.isNotEmpty
            ?
                Expanded(
                    child:ListView.builder(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 4),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        final project = projects[index];
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.shade200, width: 1.1),
                              ),
                              child: InkWell(
                                onTap: () {
                                  controller.showProjectPopup(
                                      context, project); // Popup function call
                                },
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(top: 4, right: 20),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.asset(
                                            // project.image ??
                                              "assets/images/proj_img_2.png",
                                              width: 130,
                                              height: 160),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                color: Color(0x66000000),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  // Add your save functionality here
                                                  controller.downloadPDF(project);
                                                },
                                                child: SvgPicture.asset(
                                                  'assets/images/save_button.svg',
                                                  width: 15,
                                                  height: 15,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              project.name!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 4),
                                            Text.rich(
                                              TextSpan(
                                                text: "Date: ",
                                                style: const TextStyle(
                                                  color: Color(0xCC363F72),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: HomePageController.formatDate(createdOn), // Calling controller function
                                                    style: const TextStyle(
                                                      color: Color(0xE6363F72),
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: "Project Cost: ",
                                                style: const TextStyle(
                                                  color: Color(0xCC363F72),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: "₹ ${NumberFormat('#,##,###').format(project.budget)}",
                                                    style: const TextStyle(
                                                      color: Color(0xFF363F72),
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text: "Consumption: ",
                                                style: const TextStyle(
                                                  color: Color(0xCC363F72),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: "",
                                                    style: const TextStyle(
                                                      color: Color(0xFF363F72),
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
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


                                            const SizedBox(height: 5),
                                            Text(
                                              "- - - - - - - - - - - - - - - - - - - - - -",
                                              style: TextStyle(
                                                color: Color(0xFFEDEBF4),
                                                fontSize: 20,
                                              ),
                                              overflow: TextOverflow.clip, // Clips overflowing text without showing "..."
                                              maxLines: 1, // Ensures text stays on a single line
                                              softWrap: false, // Prevents wrapping to the next line
                                            ),
                                            if ("${project.status}" ==
                                                "ACTIVE") ...[
                                              Row(
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      text: "Pending: ",
                                                      style: const TextStyle(
                                                        color: Color(0xFF363F72),
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: "${project.budget}",
                                                          style: const TextStyle(
                                                            color:
                                                            Color(0xFFB42318),
                                                            fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      Colors.transparent,
                                                      side: const BorderSide(
                                                          color: Color(0xFF603EA4)),
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 3,
                                                        horizontal: 8,
                                                      ),
                                                      minimumSize: Size(0, 24),
                                                    ),
                                                    child: Text(
                                                      "Pay Now",
                                                      style: const TextStyle(
                                                        color: Color(0xFF603EA4),
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ] else ...[
                                              Text(
                                                "${project.status}" == "IN_REVIEW"
                                                    ? "Please wait while we are reviewing it"
                                                    : "This project is not approved yet",
                                                style: TextStyle(
                                                  color: Color(0xFF363F72),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                height: 20), // Space added between containers
                          ],
                        );
                      },
                    )
                )
            :
            Center(
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/Component 160.svg',
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "You haven't create any project yet.\nCreate your first project to start with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF0EEF6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.to(() =>
                            CreateProjectScreen()); // Navigate to CreateProjectScreen
                        Future.delayed(Duration(milliseconds: 300), () {
                          // Delay to ensure screen transition before showing bottom sheet
                          Get.put(CreateProjectController())
                              .showCreateProjectBottomSheet(Get.context!);
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.add,
                            color: Color(0xFF785CB2),
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Create first project",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF785CB2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent, // Avoid default material color
        child: Container(
          height: 80, // Keep the height same
          decoration: BoxDecoration(
            color: Colors.white, // Ensure white background
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Very light shadow
                spreadRadius: 0, // No extra spread
                blurRadius: 1.5, // Slight blur for a thin effect
                offset: Offset(0, -1), // Moves shadow slightly upwards
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
