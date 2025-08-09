import 'package:flutter/material.dart';

class SlotBookingUi extends StatefulWidget {
  @override
  _SlotBookingUIState createState() => _SlotBookingUIState();
}

class _SlotBookingUIState extends State<SlotBookingUI> {
  DateTime? _selectedDate;
  int _navIndex = 0;

  Future<void> _openCalendar() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Text(
              'Hi Jacob!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Simple horizontal date row
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (i) {
                  final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                  final dates = ['03', '04', '05', '06', '07', '08', '09'];
                  final isCenter = i == 3;
                  return Column(
                    children: [
                      Text(days[i], style: TextStyle(color: Colors.blue)),
                      SizedBox(height: 6),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isCenter
                              ? Colors.grey[400]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          dates[i],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),

            SizedBox(height: 20),

            // 2x2 option cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _optionCard(
                    'Let\'s see your scheduled events',
                    Icons.access_time,
                  ),
                  _optionCard(
                    'Take a look on available rooms',
                    Icons.meeting_room,
                  ),
                  _optionCard('Book a slot now', Icons.calendar_view_day),
                  _optionCard('Check your profile', Icons.account_circle),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (i) {
          setState(() => _navIndex = i);
          if (i == 1) _openCalendar(); // calendar icon opens date picker
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget _optionCard(String text, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 56),
            SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
