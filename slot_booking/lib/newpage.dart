import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NewPage(),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
      body: Padding( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            const Text(
              "Good Morning",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            const Text(
              "Hi User!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 16),

            
          
            Expanded( 
              child: GridView.count( 
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: [ 
                  buildActionCard(
                    icon: Icons.access_time, 
                    text: "Let's see your scheduled events", 
                  ),
                  buildActionCard(
                    icon: Icons.meeting_room_outlined,
                    text: "Take a look on available rooms",
                  ),
                  buildActionCard(
                    icon: Icons.event_available,
                    text: "Book a slot now",
                  ),
                  buildActionCard(
                    icon: Icons.account_box,
                    text: "Check your profile",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
       
        onTap: (index) {
          setState(() {
            
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Planner",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget buildActionCard({required IconData icon, required String text}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 138, 156, 255)),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.indigo),
          const SizedBox(height: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
