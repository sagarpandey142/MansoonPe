import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projects/ui/screens/projects_screen/project_page_controller.dart';
import '../../../modals/create_project_res.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';
import '../create_project_screen/create_project_controller.dart';
import '../home_screens/home_page_controller.dart';
import '../open_project_screen/open_project_screen.dart';

class ProjectPageScreen extends StatefulWidget {
  const ProjectPageScreen({super.key});

  @override
  _ProjectPageScreenState createState() => _ProjectPageScreenState();
}

class _ProjectPageScreenState extends State<ProjectPageScreen> {
  final ProjectPageController controller = Get.put(ProjectPageController());
  int _currentIndex = 1;
  String createdOn = "2025-02-25T05:07:14.337787"; // Sample Date

  @override
  void initState() {
    super.initState();
    controller.getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
            child: Row(
              children: [
                const Text(
                  "Projects",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.put(CreateProjectController())
                        .showCreateProjectBottomSheet(Get.context!);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: Color(0xFF603EA4),
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "New project",
                        style: TextStyle(
                            color: Color(0xFF603EA4),
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade200, thickness: 2),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
                  itemCount: controller.projects.length,
                  itemBuilder: (context, index) {
                    final project = controller.projects[index];
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
                              var controller = Get.find<ProjectPageController>();
                              var selectedProject = controller.projects[index]; // This is 'Projects'

                              Get.to(() => OpenProjectScreen(project: selectedProject)); // Pass the correct type
                            },


                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 20),
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
                                  Container(
                                    width: 1.5,
                                    height: 180, // Adjust height as needed
                                    color: Colors.grey.shade100,
                                    margin: EdgeInsets.symmetric(horizontal: 8),
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
                                                text: HomePageController.formatDate(
                                                    createdOn), // Calling controller function
                                                style: const TextStyle(
                                                  color: Color(0xE6363F72),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 2),
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
                                                text:
                                                    "₹ ${NumberFormat('#,##,###').format(project.budget)}",
                                                style: const TextStyle(
                                                  color: Color(0xFF363F72),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 2),
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Color(
                                              project.status == "IN_REVIEW"
                                                  ? 0xFFFFF2CC // Even lighter orange
                                                  : project.status == "ACTIVE"
                                                      ? 0xFFEAF7EE // Even lighter green
                                                      : 0xFFFDECEA, // Even lighter red
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
                                          overflow: TextOverflow
                                              .clip, // Clips overflowing text without showing "..."
                                          maxLines:
                                              1, // Ensures text stays on a single line
                                          softWrap:
                                              false, // Prevents wrapping to the next line
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
                )),
          ),
        ],
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
