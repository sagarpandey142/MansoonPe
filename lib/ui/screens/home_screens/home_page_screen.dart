import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:projects/modals/project_res.dart';
import 'package:projects/ui/screens/create_project_screen/create_project_screen.dart';
import 'package:projects/ui/screens/home_screens/home_page_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_services/repo.dart';
import '../../../utils/custom_colour.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';
import '../create_project_screen/create_project_controller.dart';
import '../open_project_screen/open_project_screen.dart';
import '../profile_screen/profile_page_screen.dart';
import '../projects_screen/project_page_controller.dart';
import '../projects_screen/project_page_screen.dart';
import '../register_screen/register_page_controller.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final ProjectPageController controller = Get.put(ProjectPageController());
  // String createdOn = "2025-02-25T05:07:14.337787"; // Sample Date
  int _currentIndex = 0;
  List<Projects> projects = [];
  List<Orders> orders = [];
  String businessName = "Business Name";
  int totalCredits = 0;
  int totalSpends = 0;

  @override
  void initState() {
    super.initState();
    getProfile();
    getProjects();
    getCredits();
  }

  getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      // var uid = prefs.getString("id") ?? '';

      Repository repo = Repository(token: token);
      var res = await repo.getProfile({});
      debugPrint("VskingProfileRes:>>>$res");
      if (res.status == 200) {
        var data = res.data!.profile;
        setState(() {
          businessName = data!.businessName!;
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
      // Get.snackbar("Error", "Something went wrong!",
      //     backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  getCredits() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      Repository repo = Repository(token: token);
      var res = await repo.getAllCredits({});
      debugPrint("VskingProfileRes:>>>$res");
      if (res.status == 200) {
        try {
          var data = res.data!.credits;
          setState(() {
            totalCredits = data!.fold(0, (sum, item) => sum + (item.credited!));
            totalSpends = data.fold(0, (sum, item) => sum + (item.consumed!));
          });
        } catch (e) {}
      }
    } catch (e) {
      debugPrint("Error: $e");
      // Get.snackbar("Error", "Something went wrong!",
      //     backgroundColor: Colors.red, colorText: Colors.white);
    }
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
          // getApprovedCredit();
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
      // Get.snackbar("Error", "Something went wrong!",
      //     snackPosition: SnackPosition.TOP,
      //     backgroundColor: Colors.red,
      //     colorText: Colors.white);
    }
  }

  // getApprovedCredit() {
  //   if (projects.isNotEmpty) {
  //     for (int i = 0; i < projects.length; i++) {
  //       try {
  //         if (projects[i].orders != null && projects[i].orders!.isNotEmpty) {
  //           for (int j = 0; j < projects[i].orders!.length; j++) {
  //             if ((projects[i].orders![j].supplierPayment != null) &&
  //                 (projects[i].orders![j].supplierPayment!.status == 'SENT')) {
  //               totalApprovedCredits = totalApprovedCredits +
  //                   projects[i].orders![j].supplierPayment!.amount!;
  //               debugPrint("totalApprovedCredits:>>>$totalApprovedCredits");
  //             }
  //           }
  //         }
  //       } catch (e) {}
  //     }
  //   }
  // }

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
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
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
                    child: Image.asset(
                      'assets/images/logo_text.png',
                      fit: BoxFit.contain,
                      width: 100,
                    ),
                    // Text(
                    //   "MasonPe.",
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.white,
                    //   ),
                    // ),
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
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Summary',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            totalCredits <= 0
                ? Padding(
              padding:
              const EdgeInsets.only(top: 20, right: 15, left: 15),
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
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        CupertinoIcons.exclamationmark_circle,
                        color: Color(0xFF1E40AF),
                        size:
                        13.0, // Adjust size to fit within the height
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "We will allot credit limit in 24-48 hrs post profile evaluation",
                        style: GoogleFonts.poppins(
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
            )
                : Container(),
            SizedBox(
              height: 5,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Credit left",
                                style: GoogleFonts.poppins(
                                    color: Color(0x99FFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text(
                              "₹ ${totalCredits > 0 && totalSpends > 0 ? NumberFormat('#,##,###').format(totalCredits - totalSpends) : 0}",
                              style: GoogleFonts.poppins(
                                color: Color(0xFFFFFFFF),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                shadows: [
                                  Shadow(
                                    color: Colors.black45, //  Black shadow
                                    offset:
                                    Offset(0, 3), //  Move shadow downward
                                    blurRadius: 8, //  Smooth effect
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        totalCredits > 0 && totalSpends > 0
                            ?
                        // progressbar start
                        Padding(
                          padding:
                          const EdgeInsets.only(right: 8.0, top: 6),
                          child: CircularPercentIndicator(
                            radius: 32.0,
                            lineWidth: 6.0,
                            animation: true,
                            percent:
                            totalSpends / totalCredits > 1
                                ? 1
                                : totalSpends / totalCredits,
                            center: Text(
                              "${(((totalSpends / totalCredits) * 100) * 10).roundToDouble() / 10}%",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 13.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.white,
                            backgroundColor: Color(0x4DF9F5FF),
                          ),
                        )
                            : Container(),
                        // progressbar end
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetBuilder<RegisterPageController>(
                          init:
                          RegisterPageController(), // Ensures controller is available
                          builder: (controller) {
                            return Text(
                              businessName, // Default text if empty
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFFFFFF),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Overall Limit:",
                                      style: GoogleFonts.inter(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )
                                    // GoogleFonts.poppins(
                                    //   color: Color(0xFFFFFFFF),
                                    //   fontSize: 12,
                                    //   fontWeight: FontWeight.w400,
                                    // ),
                                  ),
                                  TextSpan(
                                    text:
                                    " ₹ ${NumberFormat('#,##,###').format(totalCredits)}",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Image.asset(
                              'assets/images/logo_bg.png',
                              fit: BoxFit.contain,
                              width: 80,
                            ),

                            // Text(
                            //   "MasonPe.",
                            //   style: GoogleFonts.poppins(
                            //     color: Color(0xFFFFFFFF),
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),

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
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xCC000000),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      projects.isNotEmpty
                          ? Get.to(() => ProjectPageScreen())
                          : Get.to(() => CreateProjectScreen());
                    },
                    child: Text(
                      "View all",
                      style: GoogleFonts.poppins(
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
                ? Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 4),
                  itemCount: projects.length > 2 ? 2 : projects.length,
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
                              var selectedProject = projects[index];
                              Get.to(() => OpenProjectScreen(
                                  projectId: selectedProject.id.toString(),
                                  projectStatus: selectedProject.status!));
                            },
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10),
                                      child: Image.asset(
                                        "assets/images/proj_img_2.png",
                                        width: 120, // Increased width
                                        height: 180, // Increased height
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 2, // Moved further down
                                      right: 0,
                                      child: Container(
                                        height: 32, // Increased height
                                        width: 32, // Increased width
                                        decoration: BoxDecoration(
                                          color: Color(0x66000000),
                                          borderRadius:
                                          BorderRadius.circular(5),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            controller.downloadPDF(project);
                                          },
                                          child: SvgPicture.asset(
                                            'assets/images/save_button.svg',
                                            height:
                                            14, // Adjusted for better scaling
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 1.5,
                                  height: 180, // Adjust height as needed
                                  color: Colors.grey.shade100,
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 6),
                                      Text(
                                        '${project.name!} , ${project.location!}',
                                        style:  GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text.rich(
                                        TextSpan(
                                          text: "Date: ",
                                          style:  GoogleFonts.poppins(
                                            color: Color(0xCC363F72),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:project.createdOn != null ? HomePageController.formatDate(
                                                  project.createdOn!) : "", // Calling controller function
                                              style: GoogleFonts.poppins(
                                                color: Color(0xE6363F72),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: "Project Cost: ",
                                          style:  GoogleFonts.poppins(
                                            color: Color(0xFF363F72),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                              "₹ ${NumberFormat('#,##,###').format(project.budget)}",
                                              style:  GoogleFonts.poppins(
                                                color: Color(0xFF363F72),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: "Consumption: ",
                                          style:  GoogleFonts.poppins(
                                            color: Color(0xCC363F72),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                              "₹ ${NumberFormat('#,##,###').format(project.credit != null ? project.credit!.consumed : 0)}",
                                              style:  GoogleFonts.poppins(
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Color(
                                            project.status == "IN_REVIEW"
                                                ? 0xFFFFFAEB // Even lighter orange
                                                : project.status == "ACTIVE"
                                                ? 0xFFECFDF3 // Even lighter green
                                                : 0xFFFEF3F2, // Even lighter red
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                                  ? 0xFF027A48
                                                  : 0xFFB42318,
                                            ),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 10),
                                        child: Text(
                                          "- - - - - - - - - - - - - - - - - - - - - -",
                                          style: GoogleFonts.poppins(
                                            color: Color(0xFFEDEBF4),
                                            fontSize: 20,
                                          ),
                                          overflow: TextOverflow
                                              .clip, // Clips overflowing text without showing "..."
                                          maxLines:
                                          1, // Ensures text stays on a single line
                                          softWrap:
                                          false, // Prevents wrapping to the next line
                                        ),
                                      ),
                                      if (("${project.status}" == "ACTIVE") &&
                                          (controller.getDueAmount(
                                              project.orders) >
                                              0)) ...[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10),
                                          child: Row(
                                            children: [
                                              Text.rich(
                                                TextSpan(
                                                  text: "Pending: ",
                                                  style:  GoogleFonts.poppins(
                                                    color: Color(0xFF363F72),
                                                    fontSize: 10,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                      "₹ ${NumberFormat('#,##,###').format(controller.getDueAmount(project.orders))}",
                                                      style:
                                                      GoogleFonts.poppins(
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
                                              ElevatedButton(onPressed: () {var selectedProject = projects[index];
                                              Get.to(() =>
                                                  OpenProjectScreen(
                                                      projectId:
                                                      selectedProject
                                                          .id
                                                          .toString(),
                                                      projectStatus:
                                                      selectedProject
                                                          .status!));
                                              },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(0, 20), //Lower this value to reduce height
                                                  backgroundColor: Colors.transparent,
                                                  side: BorderSide(color: Color(0xFF603EA4), width: 0.5),
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  visualDensity: VisualDensity.compact,
                                                ),
                                                child: Text(
                                                  "Pay Now",
                                                  style:  GoogleFonts.poppins(
                                                    color: Color(0xFF603EA4),
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ] else ...[
                                        Text(
                                          "${project.status}" == "IN_REVIEW"
                                              ? "Please wait while we are reviewing it"
                                              : "${project.status}" ==
                                              "ACTIVE"
                                              ? ""
                                              : "This project is not approved yet",
                                          style: GoogleFonts.poppins(
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
                        const SizedBox(
                            height: 20), // Space added between containers
                      ],
                    );
                  },
                ))
                : Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
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
                      style: GoogleFonts.poppins(
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
                          // CustomBottomNavigationBar.globalKey.currentState?.changeTab(1);

                          Get.to(() =>
                              CreateProjectScreen()); // Navigate to CreateProjectScreen
                          Future.delayed(Duration(milliseconds: 300), () {
                            // Delay to ensure screen transition before showing bottom sheet
                            Get.put(CreateProjectController())
                                .showCreateProjectBottomSheet(
                                Get.context!);
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent, // Avoid default material color
        child: Container(
          height: MediaQuery.of(context).size.height*0.105,  // Keep the height same
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
