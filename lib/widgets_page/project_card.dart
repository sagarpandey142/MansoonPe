import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title, date, cost, consumption, status, pendingAmount, buttonText;
  final Color statusColor;

  const ProjectCard({super.key,
    required this.title,
    required this.date,
    required this.cost,
    required this.consumption,
    required this.status,
    required this.pendingAmount,
    required this.buttonText,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Date: $date'),
            Text('Project Cost: $cost'),
            Text('Consumption: $consumption'),
            SizedBox(height: 5),
            Chip(
              label: Text(status, style: TextStyle(color: Colors.white)),
              backgroundColor: statusColor,
            ),
            if (pendingAmount.isNotEmpty)
              Text('Pending: $pendingAmount', style: TextStyle(color: Colors.red)),
            if (buttonText.isNotEmpty)
              TextButton(
                onPressed: () {},
                child: Text(buttonText, style: TextStyle(color: Colors.blue)),
              ),
          ],
        ),
      ),
    );
  }
}
