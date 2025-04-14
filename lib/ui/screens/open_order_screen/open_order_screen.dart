import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_services/repo.dart';
import '../../../modals/add_material_res.dart';
import '../../../modals/all_order_res.dart' as all_order;
import '../../../modals/project_res.dart';
import '../../../utils/custom_colour.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';
import '../projects_screen/project_page_controller.dart';
import 'open_order_controller.dart';

class OpenOrderScreen extends StatefulWidget {
  final Order? order;

  const OpenOrderScreen({super.key, this.order});

  @override
  _OpenOrderScreenState createState() => _OpenOrderScreenState();
}

class _OpenOrderScreenState extends State<OpenOrderScreen> {
  final OpenOrderController openOrderController =
      Get.put(OpenOrderController());
  final ProjectPageController projectPageController =
      Get.find<ProjectPageController>();
  int _currentIndex = 2;
  List<all_order.Orders> orders = [];
  List<all_order.Orders> originalOrders = [];
  List<Projects> projects = [];
  List<ProOptionItem> proOptList = [];
  List<Projects> filteredProjects=[];
  String selectedProject="All";
  String selectedStatus="Status";
  String selectedDate="Date";
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getProjects();
    getAllOrders();
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
          for(int i=0;i<projects.length;i++){
            var proOptItem=ProOptionItem()
                ..id=projects[i].id ?? 0
                ..name=projects[i].name ?? "";
            proOptList.add(proOptItem);
          }

          proOptList.insert(0, ProOptionItem()
              ..id=0
              ..name="All"
          );

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


  getAllOrders() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      // var uid = prefs.getString("id") ?? '';
      // var mob= prefs.getString("phone") ?? '';
      Repository repo = Repository(token: token);
      var res = await repo.getAllOrders({});
      debugPrint("VskingProfileRes:>>>$res");
      if (res.status == 200) {
        setState(() {
          orders = res.data!.orders!;
          originalOrders=orders;
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

  getAllOrdersById(id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("auth_token") ?? '';
      // var uid = prefs.getString("id") ?? '';
      // var mob= prefs.getString("phone") ?? '';
      Repository repo = Repository(token: token);
      var res = await repo.getAllOrdersById(id,{});
      debugPrint("VskingProfileRes:>>>$res");
      if (res.status == 200) {
        setState(() {
          orders = res.data!.orders!;
          originalOrders=orders;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ShaderMask(
          //         shaderCallback: (Rect bounds) {
          //           return LinearGradient(
          //             colors: [
          //               CustomColor.primaryColor,
          //               CustomColor.secondaryColor
          //             ],
          //           ).createShader(bounds);
          //         },
          //         child: Text(
          //           "Orders",
          //           style: GoogleFonts.poppins(
          //             fontSize: 20,
          //             fontWeight: FontWeight.w700,
          //             color: Color(0xCC000000),
          //           ),
          //         ),
          //       ),
          //       Icon(Icons.search, color: Colors.grey),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _isSearching
                    ? Expanded(
                  child: TextField(
                    controller: _searchController,
                    autofocus: true,
                    onChanged: (value) {
                      setState(() {
                        orders = originalOrders
                            .where((order) => order.material.toString().toLowerCase().contains(value.toString().toLowerCase()))
                            .toList();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search orders...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            _isSearching = false;
                            _searchController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                )
                    : ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [CustomColor.primaryColor, CustomColor.secondaryColor],
                    ).createShader(bounds);
                  },
                  child: Text(
                    "Orders",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xCC000000),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade100, thickness: 2),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 0),
            child: Row(
              children: [
                _buildDateButton(context),
                SizedBox(width: 15),
                _buildStatusDropdown(context),
                SizedBox(width: 15),
                _buildProjectDropdown(context),
              ],
            ),
          ),
          SizedBox(height: 0),
          filteredProjects.isNotEmpty ?
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // child: Obx(() {
                    // if (filteredProjects.isEmpty) {
                    //   return const Text("No projects available");
                    // }
                    // final project = filteredProjects.isNotEmpty ? filteredProjects[0] : null;
                    // return
                     child:
                      RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Project name: ",
                            style: TextStyle(
                              color: Color(0xCC363F72),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                '${filteredProjects[0].name ?? "N/A"}, ${filteredProjects[0].location ?? "N/A"}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF363F72),
                            ),
                          ),
                        ],
                      ),
                    )
                  // }),
                ),
                Icon(Icons.arrow_forward_rounded, size: 15, color: Colors.black54),
              ],
            ),
          ) : Container(),
          SizedBox(height: 0),
          filteredProjects.isNotEmpty ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date: ${OpenOrderController.formatDate(filteredProjects[0].createdOn.toString())}",
                  style: const TextStyle(
                    color: Color(0xE6363F72),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ) : Container(),

          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return buildOrderCard(orders[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 0,
                blurRadius: 1.5,
                offset: Offset(0, -1),
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

  Widget buildOrderCard(all_order.Orders order) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: EdgeInsets.only(bottom: 15), // Adds space between cards
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade200, // Keeps grey border
            width: 1,
          ),
        ),
        child: IntrinsicHeight(
          // Ensures all containers have the same height
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F9FC),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Order ID: ${order.id ?? 'N/A'}",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF363F72),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Chip(
                      label: Text(
                        order.status.toString().toLowerCase() == "in_review" ? "In-Review" : order.status.toString().toLowerCase() == "in_progress" ? "In-Progress" : order.status.toString().toLowerCase() == "not_approved" ? "Not-Approved" : order.status.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: _getStatusColor(order.status ?? "Pending"),//Color(0xFF5925DC),
                        ),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity:
                          VisualDensity(horizontal: -3, vertical: -4),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: -4),
                      backgroundColor: _getStatusColor(order.status ?? "Pending").withAlpha(10),//Color(0xFFF2F4F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Color(0xFFCBD5E1),
                          width: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // project details
              order.project != null ?
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Project name: ",
                                style: TextStyle(
                                  color: Color(0xCC363F72),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text:
                                '${order.project!.name ?? "N/A"}, ${order.project!.location ?? "N/A"}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF363F72),
                                ),
                              ),
                            ],
                          ),
                        )
                      // }),
                    ),
                    // Icon(Icons.arrow_forward_rounded, size: 15, color: Colors.black54),
                  ],
                ),
              ) : Container(),
              order.project != null ?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date: ${OpenOrderController.formatDate(order.project!.createdOn.toString())}",
                      style: const TextStyle(
                        color: Color(0xE6363F72),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ) : Container(),
              // project details

              // You start
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 40, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F5F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "You",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0x66363F72)),
                            ),
                            Text(
                              order.createdOn != null
                                  ? DateFormat('dd MMM yy, hh:mm a')
                                      .format(DateTime.parse(order.createdOn!))
                                  : "N/A",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                color: Color(0x99363F72),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Material Name: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xCC363F72),
                                ),
                              ),
                              TextSpan(
                                text: order.material ?? "N/A",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF363F72),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Cost of material: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xCC363F72),
                                ),
                              ),
                              TextSpan(
                                text: "₹${order.cost ?? 0}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF363F72),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Requested payment due date: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xCC363F72),
                                ),
                              ),
                              TextSpan(
                                text: order.dueDate != null
                                    ? DateFormat('dd MMM, yyyy')
                                        .format(DateTime.parse(order.dueDate!))
                                    : "N/A",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF363F72),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // if (order.status.toString().toLowerCase() == "in_progress") ...[
                        //   SizedBox(height: 12),
                        //   SizedBox(
                        //     width: double.infinity,
                        //     height: 45,
                        //     child: ElevatedButton(
                        //       onPressed: () {},
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: Color(0xFF603EA4),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //       ),
                        //       child: Text(
                        //         "Pay Now",
                        //         style: GoogleFonts.poppins(
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ]
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // You end
            //   Mason Supplier Pay start
              order.supplierPayment != null ?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 10, left: 40),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F5F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "MasonPe",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0x66363F72)),
                                ),
                                Text(
                                  order.createdOn != null
                                      ? DateFormat('dd MMM yy, hh:mm a')
                                      .format(DateTime.parse(order.supplierPayment!.updatedOn!))
                                      : "N/A",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    color: Color(0x99363F72),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Supplier payment status: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xCC363F72),
                                    ),
                                  ),
                                  TextSpan(
                                    text: order.supplierPayment!.status!.toString().toLowerCase() == "sent" ? "Payment Sent to supplier" : order.supplierPayment!.status!.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(0xFF363F72),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Sent Amount: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xCC363F72),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "₹${order.supplierPayment!.amount ?? 0}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(0xFF363F72),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Date of payment: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xCC363F72),
                                    ),
                                  ),
                                  TextSpan(
                                    text: order.dueDate != null
                                        ? DateFormat('dd MMM, yyyy')
                                        .format(DateTime.parse(order.supplierPayment!.updatedOn!))
                                        : "N/A",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(0xFF363F72),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ) :
              Container(),
              order.supplierPayment != null ?
              SizedBox(
                height: 10,
              ) : Container(),
            //   Mason Supplier Pay end
              //   Contractor Pay start
              order.contractorPayment != null ?
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 40, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F5F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "You",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0x66363F72)),
                            ),
                            Text(
                              order.contractorPayment!.createdOn != null
                                  ? DateFormat('dd MMM yy, hh:mm a')
                                  .format(DateTime.parse(order.contractorPayment!.createdOn!))
                                  : "N/A",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                color: Color(0x99363F72),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Last date of payment: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xCC363F72),
                                ),
                              ),
                              TextSpan(
                                text: order.contractorPayment!.dueDate != null
                                    ? DateFormat('dd MMM, yyyy')
                                    .format(DateTime.parse(order.contractorPayment!.dueDate!))
                                    : "N/A",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF363F72),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Due Amount: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xCC363F72),
                                ),
                              ),
                              TextSpan(
                                text: "₹${order.contractorPayment!.dueAmount ?? 0}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF363F72),
                                ),
                              ),
                            ],
                          ),
                        ),
                        order.contractorPayment!.dueAmount! <= 0 ?

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "😎 Yayyyy! No pending amount ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color(0xFF027A48),
                            ),
                          ),
                        ) : Container(),


                        if (order.contractorPayment!.dueAmount! > 0 ) ...[
                          SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                OpenOrderController().showPaymentDialog(context,order).then((_){
                                  debugPrint("Bottom sheet dismissed");
                                  getAllOrders();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF603EA4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Pay Now",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              )
                  :
              Container(),
              //   Contractor Pay end
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildProjectDropdown(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        print("Project Selected: $value");
        if(value.toString() == "0"){
          getAllOrders();
          setState(() {
            filteredProjects=[];
            selectedProject="All";
          });
          return;
        }else{
          getAllOrdersById(value);
        }

        setState(() {


          filteredProjects = projects
              .where((project) => project.id.toString().toLowerCase() == value.toLowerCase())
              .toList();
          if(filteredProjects.isNotEmpty){
            // setState(() {
              selectedProject = filteredProjects[0].name!;
            // });
          }
        });


      },
      offset: Offset(0, 40),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade300, width: 1.3),
      ),
      itemBuilder: (BuildContext context) {
        return proOptList.map((option) {
          return PopupMenuItem<String>(
            value: option.id.toString(),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey.shade500, // Light grey for "Status"
                    ),
                  ),
                  TextSpan(
                    text: option.name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: _getProjectOptionColor('default'),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1.3),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                selectedProject,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.keyboard_arrow_down,
                color: Colors.grey.shade500, size: 16),
          ],
        ),
      ),
    );
  }


  Widget _buildStatusDropdown(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        print("Status Selected: $value");
        setState(() {
          selectedStatus=value;
          // ["In_review", "Approved", "In_progress", "Closed", "Not_Approved"]
          orders = originalOrders
          .where((order) => order.status.toString().toLowerCase().contains(value.toString().replaceAll("-", "_").toLowerCase()))
              .toList();
        });
      },
      offset: Offset(0, 40), // Correct dropdown positioning
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300, width: 1.3),
      ),
      itemBuilder: (BuildContext context) {
        return _getDropdownOptions("Status").map((option) {
          return PopupMenuItem<String>(
            value: option,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color:
                _getStatusColor(option.replaceAll("-", "_")).withOpacity(0.10), // Light background
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _getStatusColor(option.replaceAll("-", "_")), width: 0),
              ),
              child: Text(
                option,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _getStatusColor(option.replaceAll("-", "_")),
                ),
              ),
            ),
          );
        }).toList();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1.3),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedStatus,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.keyboard_arrow_down,
                color: Colors.grey.shade500, size: 16),
          ],
        ),
      ),
    );
  }
// Date Picker Function (Only Calendar)
  Future<void> _selectDate(BuildContext context) async {
    DateTimeRange? selectedDateRange;
    DateTimeRange? picked1 = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDateRange: selectedDateRange,
    );

    if (picked1 != null) {
      setState(() {
        selectedDateRange = picked1;
        debugPrint("selectedDateRange:>>>$selectedDateRange");
        orders = originalOrders.where((order) {
          DateTime createdOn = DateTime.parse(order.createdOn.toString());
          return createdOn.isAfter(selectedDateRange!.start) && createdOn.isBefore(selectedDateRange!.end);
        }).toList();
      });
    }

  }
  // Date Button
  Widget _buildDateButton(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ElevatedButton(
        onPressed: () {
          _selectDate(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: Colors.grey.shade300, width: 1.3),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedDate,
              style: GoogleFonts.poppins(
                color: Color(0x99000000),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 3),
            Icon(Icons.keyboard_arrow_down,
                color: Colors.grey.shade500, size: 16),
          ],
        ),
      ),
    );
  }

}




// Status Color Mapping
Color _getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case "in_review":
      return Color(0xFFB54708);
    case "approved":
      return Color(0xFF027A48);
    case "in_progress":
      return Color(0xFF5925DC);
    case "closed":
      return Color(0xFF344054);
    case "not_approved":
      return Color(0xFFB52318);
    default:
      return Color(0xFFB54708);
  }
}


// Project Color Mapping
Color _getProjectOptionColor(String status) {
  switch (status) {
    case "Payment Sent to supplier":
      return Colors.blue.shade900; // Dark blue
    case "Pending":
      return Colors.brown.shade700; // Brownish-red
    case "Order not valid":
      return Colors.red.shade700; // Red
    default:
      return Colors.black;
  }
}

List<String> _getDropdownOptions(String type) {
  if (type == "Status") {
    return ["In-review", "Approved", "In-progress", "Closed", "Not-Approved"];
  } else if (type == "Project") {
    return ["Payment Sent to supplier", "Pending", "Order not valid"];
  }
  return [];
}


class ProOptionItem {
  int? id;
  String? name;

  ProOptionItem({this.id, this.name});

  ProOptionItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
