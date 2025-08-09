import 'package:flutter/material.dart';

// small helper for month names (no external packages needed)
const List<String> monthNames = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December'
];

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime displayDate = DateTime.now();
  DateTime? selectedDate;

  // sample upcoming events (static for demo)
  final List<Map<String, String>> events = [
    {'date': '23', 'title': 'Web Development', 'time': '4:15 - 6:00', 'room': 'Room: 314'},
    {'date': '30', 'title': 'Coding Marena', 'time': '4:30 - 5:15', 'room': 'Room: SPDK'},
  ];

  void prevMonth() {
    setState(() {
      displayDate = DateTime(displayDate.year, displayDate.month - 1, 1);
    });
  }

  void nextMonth() {
    setState(() {
      displayDate = DateTime(displayDate.year, displayDate.month + 1, 1);
    });
  }

  int daysInMonth(int year, int month) => DateTime(year, month + 1, 0).day;

  @override
  Widget build(BuildContext context) {
    final year = displayDate.year;
    final month = displayDate.month;
    final firstWeekday = DateTime(year, month, 1).weekday; // 1=Mon ... 7=Sun
    final numDays = daysInMonth(year, month);
    final leading = firstWeekday - 1;
    final totalCells = leading + numDays;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Column(
          children: [
            // month navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: prevMonth, icon: const Icon(Icons.chevron_left)),
                Text(
                  '${monthNames[month - 1]} $year',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(onPressed: nextMonth, icon: const Icon(Icons.chevron_right)),
              ],
            ),
            const SizedBox(height: 8),

            // day names
            Row(
              children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                  .map(
                    (d) => Expanded(
                      child: Center(
                        child: Text(
                          d,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),

            // calendar grid
            Expanded(
              child: GridView.builder(
                itemCount: (totalCells + (7 - (totalCells % 7)) % 7), // pad to full weeks
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  if (index < leading) return Container(); // empty slot

                  final dayNum = index - leading + 1;
                  if (dayNum > numDays) return Container(); // padded empty

                  final cellDate = DateTime(year, month, dayNum);
                  final isToday = cellDate.year == DateTime.now().year &&
                      cellDate.month == DateTime.now().month &&
                      cellDate.day == DateTime.now().day;
                  final isSelected = selectedDate != null &&
                      selectedDate!.year == cellDate.year &&
                      selectedDate!.month == cellDate.month &&
                      selectedDate!.day == cellDate.day;

                  return GestureDetector(
                    onTap: () => setState(() => selectedDate = cellDate),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blueAccent : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          dayNum.toString(),
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : (isToday ? Colors.blueAccent : Colors.black87),
                            fontWeight: isSelected || isToday
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // OK / Cancel row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => setState(() => selectedDate = null),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: selectedDate == null
                      ? null
                      : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Picked ${selectedDate!.toLocal().toString().split(' ')[0]}',
                              ),
                            ),
                          );
                        },
                  child: const Text('OK'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Upcoming events
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Upcoming Events',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: events.map((e) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          e['date']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    title: Text(e['title']!),
                    subtitle: Text('${e['time']} • ${e['room']}'),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${e['title']} tapped')),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
