import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  int _bottomIndex = 0;

  // generate a simple 7-day list starting today
  List<DateTime> weekDates() {
    final now = DateTime.now();
    return List.generate(7, (i) => now.add(Duration(days: i)));
  }

  Widget dateTile(DateTime d) {
    final isSelected = d.day == selectedDate.day &&
        d.month == selectedDate.month &&
        d.year == selectedDate.year;
    final dayLabel = ['S', 'M', 'T', 'W', 'T', 'F', 'S'][d.weekday % 7];
    return GestureDetector(
      onTap: () => setState(() => selectedDate = d),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blueGrey[700] : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              dayLabel,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            d.day.toString().padLeft(2, '0'),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blueGrey[700] : Colors.black87,
            ),
          )
        ],
      ),
    );
  }

  Widget featureCard(IconData icon, String title) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: Colors.grey.shade300)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () =>
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title tapped'))),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36),
              SizedBox(height: 12),
              Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dates = weekDates();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning', style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 6),
            Text('Hi Jacob!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            // Horizontal date selector
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: dates.map((d) => dateTile(d)).toList(),
              ),
            ),

            SizedBox(height: 18),

            // grid of feature cards (2x2)
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                featureCard(Icons.calendar_today, "Let's see your\nscheduled events"),
                featureCard(Icons.meeting_room, "Take a look on\navailable rooms"),
                featureCard(Icons.book_online, "Book a slot now"),
                featureCard(Icons.person_outline, "Check your profile"),
              ],
            ),

            SizedBox(height: 18),
            // small hint
            Text('Selected: ${selectedDate.toLocal().toString().split(' ')[0]}',
                style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 60), // space for bottom nav
          ],
        ),
      ),

      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomIndex,
        onTap: (i) {
          setState(() => _bottomIndex = i);
          if (i == 1) {
            Navigator.pushNamed(context, '/calendar');
          // ignore: curly_braces_in_flow_control_structures
          } else if (i == 2) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile tapped')));
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
