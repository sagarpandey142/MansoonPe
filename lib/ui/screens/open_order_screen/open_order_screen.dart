import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/custom_colour.dart';
import '../../../widgets_page/custom_bottom_navigator_bar.dart';
import 'open_order_controller.dart';

class OpenOrderScreen extends StatefulWidget {
  const OpenOrderScreen({super.key});

  @override
  _OpenOrderScreenState createState() => _OpenOrderScreenState();
}

class _OpenOrderScreenState extends State<OpenOrderScreen> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(  // ✅ Wrapped with SingleChildScrollView to prevent overflow
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
                          colors: [
                            CustomColor.primaryColor,
                            CustomColor.secondaryColor
                          ],
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
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade100, thickness: 2),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  children: [
                    _buildFilterButton("Date"),
                    SizedBox(width: 10),
                    _buildFilterButton("Status"),
                    SizedBox(width: 10),
                    _buildFilterButton("Project"),
                  ],
                ),
              ),

              _buildOrderCard("Closed", "Yaay! No Pending Amount", Colors.green),
              _buildOrderCard("In-review", " ", Colors.brown, showButton: true),
              _buildOrderCard("Not Approved", " ", Colors.red),
              _buildOrderCard("Approved", "Nothing Due", Colors.green),
              SizedBox(height: 20), // Added space at bottom to avoid overflow
            ],
          ),
        ),
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
                color: Colors.black.withOpacity(0.2),
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

  Widget _buildFilterButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: Colors.grey.shade300, width: 1.1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Color(0x99000000),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          SizedBox(width: 3),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _buildOrderCard(String status, String message, Color color, {bool showButton = false}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F9FC),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Order ID: 123456",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xFF363F72)),
                      ),
                    ),
                  ),
                  Chip(
                    label: Text(
                      status,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5925DC),
                      ),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity(horizontal: -3, vertical: -4), // Reducing vertical spacing
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: -4), // Reduce top & bottom padding
                    backgroundColor: Color(0xFFF2F4F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Slightly smaller border radius
                      side: BorderSide(
                        color: Color(0xFFCBD5E1),
                        width: 0.5, // Thinner border
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("You", style: TextStyle(fontSize: 12, color: Color(0x66363F72))),
                  Text(
                    DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now()),
                    style: GoogleFonts.poppins(fontSize: 10, color: Color(0x99363F72)),
                  ),
                  SizedBox(height: 5),
                  _buildDetailText("Material Name: ", "TMT Bars"),
                  SizedBox(height: 5),
                  _buildDetailText("Cost of material: ", "₹8,500"),
                  SizedBox(height: 5),
                  _buildDetailText("Requested payment due date: ", "25 Oct,2024"),
                  if (showButton) ...[
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          OpenOrderController().showPaymentDialog(context);
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
                  ],
                  SizedBox(height: 15),
                  Center(
                    child: Text(message, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color)),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailText(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(fontSize: 12, color: Color(0xCC363F72)),
          ),
          TextSpan(
            text: value,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF363F72)),
          ),
        ],
      ),
    );
  }
}
