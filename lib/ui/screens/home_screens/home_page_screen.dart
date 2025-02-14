import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/create_project_screen/create_project_screen.dart';

import '../../../model_class/project_model.dart';
import '../../../utils/custom_colour.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';
import '../order_screen/order_page_screen.dart';
import '../profile_screen/profile_page_screen.dart';
import '../projects_screen/project_page_controller.dart';
import '../projects_screen/project_page_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final ProjectPageController controller = Get.put(ProjectPageController());
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        _currentIndex == 0 ?
        Padding(
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
                      child: SvgPicture.asset("assets/images/menu_vector.svg"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
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
                      image:
                          AssetImage('assets/images/home_regi_container.png'),
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
                          Text("₹ 0",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Devesh Gupta",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Limit: ₹ 0",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
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
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Projects",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF62449D),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
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
                      "You haven't created any project yet.\nCreate your first project to start with",
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
                          Get.to(() => CreateProjectScreen());
                        },
                        child: Text(
                          "+   Create first project",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF785CB2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )

            :
        _currentIndex == 1 ?
        getProjectPage(context)

            :
        _currentIndex == 2 ?
        Text("2")
            :
        _currentIndex == 3 ?
        Text("3")
        :
        Container()
        ,
        bottomNavigationBar: getBottomBar(context)
        // CustomBottomNavigationBar(
        //   currentIndex: _currentIndex,
        //   onTap: (index) {
        //     print("vskingI:>>>$index");
        //     setState(() {
        //       _currentIndex = index;
        //     });
        //   },
        // )
    );
  }

  getBottomBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Prevents items from shifting
      currentIndex: _currentIndex,
      selectedItemColor: Color(0xFF603EA4),
      unselectedItemColor: Color(0x99000000),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        print("vskingII000:>>>$index");
        setState(() {
          _currentIndex = index;
        });
        // _navigateToScreen(index);
      },
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 0
                ? "assets/custom_bottom_navigation/home_color.svg"
                : "assets/custom_bottom_navigation/home.svg",
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 1
                ? "assets/custom_bottom_navigation/project_color.svg"
                : "assets/custom_bottom_navigation/project.svg",
          ),
          label: "Projects",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 2
                ? "assets/custom_bottom_navigation/order_color.svg"
                : "assets/custom_bottom_navigation/order.svg",
          ),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 3
                ? "assets/custom_bottom_navigation/profile_color.svg"
                : "assets/custom_bottom_navigation/profile.svg",
          ),
          label: "Profile",
        ),
      ],
    );
  }

  Widget getProjectPage(BuildContext context){
    return Obx(() => ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: controller.projects.length,
      itemBuilder: (context, index) {
        final ProjectModel project = controller.projects[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 90,
                  color: Colors.grey[300],
                  child: const Icon(Icons.file_present, size: 40, color: Colors.grey),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(project.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("Date: ${project.date}", style: TextStyle(color: Colors.grey[600])),
                      Text("Project Cost: ${project.cost}", style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text("Consumption: ${project.consumption}", style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(project.statusColor).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          project.status,
                          style: TextStyle(color: Color(project.statusColor), fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (project.statusType == "active") ...[
                        const SizedBox(height: 5),
                        Text("Pending: ${project.pending}", style: const TextStyle(color: Colors.red, fontSize: 14)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(project.buttonText ?? ""),
                          ),
                        )
                      ],
                      if (project.statusType != "active") ...[
                        const SizedBox(height: 5),
                        Text(project.message ?? "", style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  Widget getProjectPageAppBar(BuildContext context){
    return AppBar(
      title: const Text("Projects", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
      actions: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.purple),
          label: const Text("New project", style: TextStyle(color: Colors.purple, fontSize: 16)),
        )
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
