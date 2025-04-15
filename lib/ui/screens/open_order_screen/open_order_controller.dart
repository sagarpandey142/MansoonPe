import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projects/modals/cont_pay_req.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_services/repo.dart';
import '../../../modals/all_order_res.dart';

class OpenOrderController extends GetxController {

  static String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String time = DateFormat.jm().format(dateTime); // e.g. 10:45 AM
    String date = DateFormat('dd MMM, yyyy').format(dateTime); // e.g. 15 Apr 2025
    return '$time, $date'; // final format: 10:45 AM · 15 Apr 2025
  }


  Future<void> showPaymentDialog(BuildContext context,Orders order) async {
    return showModalBottomSheet(
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
                      const EdgeInsets.only(top: 5, left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F9FC),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "Order ID: ${order.id}",
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
                                  color: Color(0x335925FF), width: 1),
                            ),
                            child: Text(
                              "${order.status.toString().toLowerCase() == 'in_progress' ? 'In-progress' : order.status}",
                              style: GoogleFonts.poppins(
                                color: Color(0xFF5925DC),
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Project & Material name
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
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
                                  text: "${order.project?.name}, ${order.project?.location}",
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
                        height: 15,
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
                              text: "${order.material}",
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
                        height: 15,
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
                              border: Border.all(color: Color(0x331066B5),width: 1),
                            ),
                            child: Text(
                              "₹ ${NumberFormat('#,##,###').format(order.supplierPayment?.amount)}",
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
                            "Total Payment made: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xCC363F72),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 3),
                            decoration: BoxDecoration(
                              color: Color(0xFFECFDF3),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0x33027A48),width: 1),
                            ),
                            child: Text(
                              "₹ ${NumberFormat('#,##,###').format(getTotalPaymentMade(order.contractorPayment))}",//order.contractorPayment?.dueAmount)
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
                              border: Border.all(color: Color(0x33B54708),width: 1),
                            ),
                            child: Text(
                              "₹ ${NumberFormat('#,##,###').format(order.contractorPayment?.dueAmount)}",
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
                                  order.dueDate != null ? DateFormat('dd MMM yy, hh:mm a').format(
                                      DateTime.parse("${order.dueDate}")
                                  ) : "", // Formats date and time
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    color: Colors.black,
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
                                    text: order.contractorPayment?.dueDate != null ? DateFormat('dd MMM ,yyyy').format(
                                        DateTime.parse("${order.contractorPayment?.dueDate}")
                                    ) : "",
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
                                    text: "₹ ${NumberFormat('#,##,###').format(order.contractorPayment?.dueAmount)}",
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
                              _showEnterPayBottomSheet(context,order,"${order.contractorPayment?.dueAmount}");
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
                order.contractorPayment!.payments!.isNotEmpty ?
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: order.contractorPayment!.payments!.length,
                      itemBuilder: (context,index){
                        final payment = order.contractorPayment!.payments![index];
                        return Container(
                          margin: EdgeInsets.only(top: 8.0),
                          child: Padding(
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
                                            "₹ ${NumberFormat('#,##,###').format(payment.amount)}",
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
                                              border: Border.all(color: Color(
                                                  0x33027A48), width: 1),
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
                                            DateFormat('MMM dd, yyyy').format(
                                                DateTime.parse("${payment.createdOn}")
                                            ),
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
                                                  text: "${payment.mode}",
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
                        );
                      }
                  ),
                )
                    :
                Container()
                ,

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


  void _showEnterPayBottomSheet(BuildContext context,Orders order,amount) {
    TextEditingController amountController = TextEditingController();
    amountController.text = amount;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows bottom sheet to expand properly
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16, // Adjust for keyboard
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter amount",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  debugPrint("Amount:>>${amountController.text}");
                  // Navigator.pop(context); // Close bottom sheet
                  payAmount(context, "${order.contractorPayment?.id}", amountController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF603EA4),
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("Submit",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> payAmount(context, payID,amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("auth_token") ?? '';
    amount = amount.replaceAll(',', '');
    try {
      ContPayReq req = ContPayReq();
      req.amount=amount;
      req.mode="MANUAL";
      Repository repo = Repository(token: token);
      var res = await repo.payAmountAPI(payID.toString(), req);
      debugPrint("MRES:>>$res");
      if (res.status == 201) {
        Navigator.pop(context);
        Navigator.pop(context);
        // showTopMessage(context, "Material Successfully Created!");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Payment Successfully Done!"),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );

        // getOrders(projectID);
      } else {
        showTopMessage(context,"${res.message}");
      }
    }on DioException catch (e) {
      debugPrint("VSKING:>>>${e.message}");
      showTopMessage(context, "Something went wrong!");
    }
  }

  static void showTopMessage(BuildContext context, String message) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50, // Adjust this value to change the position of the popup
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // Remove the message after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  var orderStatus = ''.obs; // Observable variable for status

  // Function to update order status
  void updateOrderStatus(String status) {
    orderStatus.value = status;
  }
  int getTotalPaymentMade(ContractorPayment? contractorPayment){
    int total=0;
    if(contractorPayment != null){
      var payment=contractorPayment.payments;
      if(payment == null)return total;
      for(int i=0;i<payment.length;i++){
        total += payment[i].amount!;
      }
    }
    return total;
  }
}