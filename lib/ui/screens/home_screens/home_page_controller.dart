import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePageController {
  /// Function to handle menu button press
  void onMenuPressed() {
    debugPrint("Menu button pressed");
    // Implement navigation or side menu logic
  }

  /// Function to format date from API response
  static String formatDate(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat("d MMM yy, hh:mm a").format(dateTime);
    } catch (e) {
      return "Invalid Date"; // Error handling
    }
  }
}
