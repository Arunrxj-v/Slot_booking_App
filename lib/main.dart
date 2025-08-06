import 'package:flutter/material.dart';

void main() => runApp(TableBookingApp());

class TableBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF9F2FC),
        fontFamily: 'Roboto',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      home: BookTablePage(), 
    );
  }
}

// ✅ Add this part:
class BookTablePage extends StatefulWidget {
  @override
  State<BookTablePage> createState() => _BookTablePageState();
  

}


class _BookTablePageState extends State<BookTablePage> {
  DateTime? _selectedDate;
  String? _selectedTime;

  final List<String> _timeSlots = [
    '09:00', '09:30', '10:00', '10:30',
    '11:00', '11:30', '12:00', '12:30',
    '13:00', '13:30', '14:00', '14:30',
    '15:00', '15:30', '16:00', '16:30',
    '17:00', '17:30', '18:00', '18:30',
  ];

  String formatDate(DateTime date) {
    final months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget dateSelector() {
  return GestureDetector(
    onTap: () => _selectDate(context),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today_rounded, color: Colors.deepPurple),
          const SizedBox(width: 12),
          Text(
            _selectedDate != null
                ? formatDate(_selectedDate!)
                : 'Select Date',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}


 Widget timeSlotSelector() {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 3.5, // Adjust height of items
        children: _timeSlots.map((time) {
          bool isSelected = _selectedTime == time;
          return ChoiceChip(
            avatar: Icon(
              Icons.schedule,
              size: 16,
              color: isSelected ? Colors.white : Colors.grey.shade700,
            ),
            label: Text(
              time,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            selected: isSelected,
            onSelected: (_) => setState(() => _selectedTime = time),
            selectedColor: Colors.deepPurple,
            backgroundColor: Colors.grey.shade200,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: StadiumBorder(),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          );
        }).toList(),
      ),
    ),
  );
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book SDPK Lab'),
        backgroundColor: Colors.deepPurple,
      ),
      

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Date:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            dateSelector(),
            const SizedBox(height: 16),
            const Text('Select Time Slot:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            timeSlotSelector(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: (_selectedDate != null && _selectedTime != null)
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Booking Confirmed:\n${formatDate(_selectedDate!)} at $_selectedTime',
                          ),
                        ));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}