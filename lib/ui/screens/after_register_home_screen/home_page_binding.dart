import 'package:flutter/material.dart';

class HomePageBinding {

  static Widget buildCreditCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credit Balance',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '\$5,200.00',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget buildMyProjectsSection() {
    return Text(
      "My Projects",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  static Widget buildEmptyState() {
    return Center(
      child: Text(
        "No projects found.",
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
