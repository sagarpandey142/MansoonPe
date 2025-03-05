import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OpenOrderController extends GetxController {


  void showPaymentDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full-screen height if needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order ID and status row
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Details",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close,color: Colors.grey,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade400, thickness: 1),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0x1B5925FF), // Reduced opacity (33 instead of 66)
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0x335925FF)),
                            ),
                            child: Text(
                              "In-progress",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF5925FF),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Project & Material name
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Add this line
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Project Name: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xCC363F72),
                              ),
                            ),
                            TextSpan(
                              text: "JMD Building, Gurgaon",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Material Name: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xCC363F72),
                              ),
                            ),
                            TextSpan(
                              text: "TMT Bars",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start, // Ensures alignment
                        children: [
                          Text(
                            "Total Payment Received by you: ",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0x1B25B3FF),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Text(
                              "₹ 10,00,000",
                              style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Payment mode: ",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0x1B25FF29),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0x3387FF25)),
                            ),
                            child: Text(
                              "₹ 8,00,000",
                              style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Payment left: ",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0x1BFFDB25),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0x7EFFCC25)),
                            ),
                            child: Text(
                              "₹ 2,00,000",
                              style: GoogleFonts.poppins(
                                color: Colors.brown,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Text(
                    "Payment History",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Payment history section
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Action Required",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.brown,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  DateFormat('dd-MM-yyyy hh:mm a').format(
                                      DateTime.now()), // Formats date and time
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    color: Color(0x99363F72),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Last date of payment: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "25 Aug, 2024",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xFF000000),
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
                                      fontSize: 14,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "₹ 8,500",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
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
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF0EEF6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Amount",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text("₹ 4,00,000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Color(0x1B25FF42),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Color(0x7E96FF25)),
                                  ),
                                  child: Text(
                                    "Paid",
                                    style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "June 10, 2024",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Mode of payment: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.brown,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Manual",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF0EEF6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Amount",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.brown,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text("₹ 4,00,000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Color(0x1B25FF42),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Color(0x7E96FF25)),
                                  ),
                                  child: Text(
                                    "Paid",
                                    style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "June 10, 2024",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Mode of payment: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.brown,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Manual",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Close button
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        OpenOrderController().showPaymentDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF0EEF6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "View in Projects",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF603EA4),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        );
      },
    );
  }
}
