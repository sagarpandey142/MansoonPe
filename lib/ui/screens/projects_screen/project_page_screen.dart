import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/ui/screens/projects_screen/project_page_controller.dart';
import '../../../model_class/project_model.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';

class ProjectPageScreen extends StatefulWidget {
  const ProjectPageScreen({super.key});

  @override
  _ProjectPageScreenState createState() => _ProjectPageScreenState();
}

class _ProjectPageScreenState extends State<ProjectPageScreen> {
  final ProjectPageController controller = Get.put(ProjectPageController());
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
      body:
      Obx(() => ListView.builder(
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
      )),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
