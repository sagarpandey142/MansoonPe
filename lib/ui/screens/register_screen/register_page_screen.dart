import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_screen/login_page_screen.dart';
import 'register_page_controller.dart';

class RegisterPageScreen extends StatefulWidget {
  const RegisterPageScreen({super.key});

  @override
  State<RegisterPageScreen> createState() => _RegisterPageScreenState();
}

class _RegisterPageScreenState extends State<RegisterPageScreen> {

  @override
  void dispose() {
    logout(context);
    super.dispose();

  }
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token");
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPageScreen()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPageController>(
      init: RegisterPageController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            bool? shouldExit = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Exit App'),
                content: const Text('Do you want to exit the app?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () => logout(context),
                    child: const Text('Yes'),
                  ),
                ],
              ),
            );
            return shouldExit ?? false;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                    icon: const Icon(Icons.chevron_left,
                        color: Colors.black, size: 40),
                    onPressed: () {
                      logout(context);
                    }),
                title: Text(
                  "Register to continue",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xCC000000),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1),
                  child: Container(
                    color: const Color(0xFFEFEFEF),
                    height: 3,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      "Business Name *",
                      controller.businessNameController,
                      controller.isBusinessNameValid,
                    ),
                    const SizedBox(height: 15),
                    _buildTextField(
                      "GST Number *",
                      controller.gstNumberController,
                      controller.isGstValid,
                      isUpperCase: true,
                      maxLength: 15,
                    ),
                    const SizedBox(height: 15),
                    _buildTextField(
                      "PAN Number *",
                      controller.panNumberController,
                      controller.isPanValid,
                      isUpperCase: true,
                      maxLength: 10,
                    ),

                    const SizedBox(height: 20),

                    // Terms & Conditions Checkbox
                    Row(
                      children: [
                        Obx(() => Checkbox(
                          activeColor: const Color(0xFF603EA4),
                          value: controller.isChecked.value,
                          onChanged: (value) =>
                              controller.toggleCheckbox(value!),
                        )),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "By continuing, you agree to our ",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0x99000000)),
                              children: [
                                TextSpan(
                                  text: "Terms of Service, ",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF603EA4)),
                                ),
                                TextSpan(
                                  text: "Privacy Policy ",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF603EA4)),
                                ),
                                TextSpan(
                                  text: "and ",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54),
                                ),
                                TextSpan(
                                  text: "Cookie Policy.",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF603EA4)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    // Continue Button
                    Obx(
                          () => ElevatedButton(
                        onPressed: controller.isChecked.value
                            ? () {
                          controller.continueRegistration();
                        }
                            : null, // Disable if not checked
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.isChecked.value
                              ? const Color(0xFF603EA4) // Purple when enabled
                              : Colors.grey, // Grey when disabled
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
      String label,
      TextEditingController controller,
      RxBool isValid, {
        bool isUpperCase = false,
        int? maxLength,
      }) {
    return Obx(() => TextField(
      style: const TextStyle(height: 2.5),
      controller: controller,
      textCapitalization:
      isUpperCase ? TextCapitalization.characters : TextCapitalization.none,
      maxLength: maxLength, // Restrict max input length
      onChanged: (value) {
        if (isUpperCase) {
          String newValue = value.toUpperCase();
          if (maxLength != null && newValue.length > maxLength) {
            newValue =
                newValue.substring(0, maxLength); // Trim extra characters
          }
          controller.value = controller.value.copyWith(
            text: newValue,
            selection: TextSelection.collapsed(offset: newValue.length),
          );
        }
      },
      decoration: InputDecoration(
        labelText: label,
        counterText: "", // Hides the character count display
        labelStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: isValid.value ? Color(0xFFE7E7E7) : Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: isValid.value ? Colors.purple : Colors.red, width: 2),
        ),
        errorText: isValid.value ? null : "Invalid $label",
      ),
    ));
  }
}