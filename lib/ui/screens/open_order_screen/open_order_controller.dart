import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../modals/order_res.dart';

class OpenOrderController extends GetxController {
  var orders = <Orders>[].obs;

  static String formatDate(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat("d MMM yy, hh:mm a").format(dateTime);
    } catch (e) {
      return "Invalid Date"; // Error handling
    }
  }

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
                  padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Details",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade300, thickness: 1),
                Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 5, left: 15, right: 15),
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
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF363F72)),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(
                                  0xFFF4F3FF), // Reduced opacity (33 instead of 66)
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Color(0xFF5925FF), width: 0.1),
                            ),
                            child: Text(
                              "In-progress",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF5925DC),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Project & Material name
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 15),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start, // Add this line
                    children: [
                      Row(
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
                                    color: Color(0xFF363F72),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            'assets/images/box_arrow.svg',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                                color: Color(0xFF363F72),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start, // Ensures alignment
                        children: [
                          Text(
                            "Total Payment Received by you: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xCC363F72),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0xFFEFF4F9),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0xFF1066B5),width: 0.1),
                            ),
                            child: Text(
                              "₹ 10,00,000",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF1066B5),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Payment mode: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xCC363F72),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0xFFECFDF3),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0xFF027A48),width: 0.1),
                            ),
                            child: Text(
                              "₹ 8,00,000",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF027A48),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Payment left: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xCC363F72),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFAEB),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0xFFB54708),width: 0.1),
                            ),
                            child: Text(
                              "₹ 2,00,000",
                              style: GoogleFonts.poppins(
                                color: Color(0xFFB54708),
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
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 23,
                    ),
                    overflow: TextOverflow
                        .clip, // Clips overflowing text without showing "..."
                    maxLines: 1, // Ensures text stays on a single line
                    softWrap: false, // Prevents wrapping to the next line
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Payment History",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xCC000000),
                    ),
                  ),
                ),
                // Payment history section
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFAEB),
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
                                    color: Color(0xFFB54708),
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
                                    color: Color(0xCC363F72),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Last date of payment: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xFFB54708),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "25 Aug, 2024",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(0xFF363F72),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Due Amount: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xFFB54708),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "₹ 8,500",
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
                        SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          height: 42,
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
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F7FC),
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
                              children: [
                                Text(
                                  "Amount",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color(0xFF363F72),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(), // Pushes next items to the right
                                Text(
                                  "₹ 4,00,000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xFF363F72),
                                  ),
                                ),
                                SizedBox(width: 10), // Spacing between text and container
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Color(0xFF027A48), width: 0.1),
                                  ),
                                  child: Text(
                                    "Paid",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF027A48),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "June 10, 2024",
                                  style: GoogleFonts.poppins(
                                    color: Color(0x99000000),
                                    fontWeight: FontWeight.w400,
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
                                          fontSize: 10,
                                          color: Color(0xCC363F72),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Manual",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          color: Color(0xFF363F72),
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
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F7FC),
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
                              children: [
                                Text(
                                  "Amount",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color(0xFF363F72),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(), // Pushes next items to the right
                                Text(
                                  "₹ 4,00,000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xFF363F72),
                                  ),
                                ),
                                SizedBox(width: 10), // Spacing between text and container
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFECFDF3),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Color(0xFF027A48), width: 0.1),
                                  ),
                                  child: Text(
                                    "Paid",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF027A48),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "June 10, 2024",
                                  style: GoogleFonts.poppins(
                                    color: Color(0x99000000),
                                    fontWeight: FontWeight.w400,
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
                                          fontSize: 10,
                                          color: Color(0xCC363F72),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Manual",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          color: Color(0xFF363F72),
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF0EEF6), // Light background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Slightly increased for smooth edges
                          side: BorderSide(color: Color(0xFFE0DAF1), width: 0.8), // Softer border
                        ),
                        elevation: 0, // Remove shadow for a cleaner look
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
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }



  var orderStatus = ''.obs; // Observable variable for status

  // Function to update order status
  void updateOrderStatus(String status) {
    orderStatus.value = status;
  }
}