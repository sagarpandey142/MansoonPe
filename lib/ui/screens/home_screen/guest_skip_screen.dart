import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/ui/screens/home_screens/home_page_controller.dart';
import 'package:projects/utils/custom_colour.dart';
import '../../../model_class/project_model.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';
import '../projects_screen/project_page_controller.dart';

class GuestSkipScreen extends StatefulWidget {
  const GuestSkipScreen({super.key});

  @override
  _GuestSkipScreenState createState() => _GuestSkipScreenState();
}

class _GuestSkipScreenState extends State<GuestSkipScreen> {
  final ProjectPageController controller = Get.put(ProjectPageController());
  int _currentIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      _currentIndex == 0 ?
      SingleChildScrollView(
        child: Padding(
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
                          colors: [CustomColor.primaryColor, CustomColor.secondaryColor], // Gradient colors
                        ).createShader(bounds);
                      },
                      child: Text(
                        "MasonPe.",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white, // Keep it white, ShaderMask applies the gradient
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // Adjust padding based on screen width
                      child: SvgPicture.asset("assets/images/menu_vector.svg"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 200,
                  width: 610,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/home_background_image.png'), // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Want Building Materials?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF9E9C9C),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Register Now to",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "• Buy products on credit",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic, // Makes the text italic
                          color: Color(0xFF9E9C9C),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "• Expand your business",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF9E9C9C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Get.find<HomePageController>().showRegistrationBottomSheet(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            color: Colors.grey,
                            width: 1.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Register Now",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Projects",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "View all",
                      style: GoogleFonts.poppins(
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
                      child: Image.asset(
                        'assets/images/file_image.png',
                        width: MediaQuery.of(context).size.width * 0.2, // 20% of screen width
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "You haven't created any project yet.\nCreate your first project to start with",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 200, // Adjust width as needed
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFF0EEF6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle create first project action
                        },
                        child: Text(
                          "+   Create first project",
                          style: GoogleFonts.poppins(
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
      bottomNavigationBar:getBottomBar(context)
      // CustomBottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index; // Update the selected index
      //     });
      //   },
      // ),
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
}
