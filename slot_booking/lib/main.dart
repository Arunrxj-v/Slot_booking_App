import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'calendar_screen.dart';

void main() => runApp(SimpleSchedulerApp());

class SimpleSchedulerApp extends StatelessWidget {
  const SimpleSchedulerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Scheduler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/calendar': (_) => CalendarScreen(),
      },
    );
  }
}
