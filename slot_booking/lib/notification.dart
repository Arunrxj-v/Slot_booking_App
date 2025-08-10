import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    String current = DateFormat('hh:mm a').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Notifications",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(232, 255, 255, 255),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 153, 194),
      ),
      body: ListView.separated(
        itemBuilder: (ctx, i) {
          return ListTile(
            title: Text("Notification $i"),

            trailing: Text(current),
          );
        },
        separatorBuilder: (ctx, i) {
          return Divider();
        },
        itemCount: 20,
      ),
    );
  }
}
