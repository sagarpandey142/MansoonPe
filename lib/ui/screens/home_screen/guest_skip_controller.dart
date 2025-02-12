import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestSkipController extends GetxController {
  var creditLeft = 0.obs;
  var userName = "Devesh Gupta";
  var creditLimit = 0.obs;

  void updateCredit(int newCredit) {
    creditLeft.value = newCredit;
  }

  void updateUserName(String newName) {
    userName = newName;
  }

  void updateCreditLimit(int newLimit) {
    creditLimit.value = newLimit;
  }

  void showRegistrationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Register to continue",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.grey),
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2, // Increases the thickness
                  color: Color(0xFFE7E7E7), // Light gray color
                  height: 20, // Adjust spacing
                ),
                SizedBox(height: 10),
                _buildTextField("Business Name"),
                _buildTextField("GST Number"),
                _buildTextField("PAN Number"),
                _buildMobileNumberField(),
                _buildOtpField("OTP"),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back(); // Close the registration form
                        showSuccessPopup(context); // Show success popup
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF603EA3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity,
                            50), // Increased button height to 50
                      ),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSuccessPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 50),
              SizedBox(height: 20),
              Text(
                "You have registered successfully",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "You can now submit your first project",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back(); // Close success popup
                    // Navigate to project creation page if needed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF603EA3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOtpField(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: TextField(
        maxLength: 7, // 6 digits + 1 for '-'
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Only allows digits
          LengthLimitingTextInputFormatter(6), // Restrict to 6 digits
          TextInputFormatter.withFunction((oldValue, newValue) {
            String text =
                newValue.text.replaceAll('-', ''); // Remove existing '-'

            if (text.length > 3) {
              text =
                  '${text.substring(0, 3)}-${text.substring(3)}'; // Add '-' after 3 digits
            }

            return TextEditingValue(
              text: text,
              selection: TextSelection.collapsed(offset: text.length),
            );
          }),
        ],
        decoration: InputDecoration(
          labelText: label, // Now it takes a dynamic label
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.transparent, // Transparent background
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey), // Changed to grey
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Colors.grey), // Grey border when not focused
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.grey, width: 2), // Grey border when focused
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          counterText: "", // Hides the 7/7 counter
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.transparent, // Transparent background
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey), // Changed to grey
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Colors.grey), // Grey border when not focused
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.grey, width: 2), // Grey border when focused
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        ),
      ),
    );
  }

  Widget _buildMobileNumberField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Mobile Number",
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.transparent, // Transparent background
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey), // Changed to grey
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Colors.grey), // Grey border when not focused
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.grey, width: 2), // Grey border when focused
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          suffixText: "Get OTP",
          suffixStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF949494), // You can change the color as per design
          ),
        ),
      ),
    );
  }
}
