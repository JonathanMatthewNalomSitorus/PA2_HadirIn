import 'package:flutter/material.dart';
import 'ParentApp.dart';

class ChildDailyRecap extends StatelessWidget {
  final String bulan;
  final dynamic data;

  const ChildDailyRecap({Key? key, required this.bulan, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _buildRekapKalender(),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  PreferredSizeWidget _buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 224, 197),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: Text(
                    'Rekapitulasi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 66, 66, 66),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color.fromARGB(255, 122, 116, 116),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRekapKalender() {
    return Column(
      children: [
        const Text(
          'Detail Status Kehadiran Setiap Hari',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildCalendar(),
        const SizedBox(height: 24),
        _buildLegend(),
      ],
    );
  }

  Widget _buildCalendar() {
    final Map<int, Color> markedDates = {
      8: const Color(0xFFE8E38A),
      9: const Color(0xFFE8E38A),
      10: const Color(0xFFE8E38A),
      11: const Color(0xFF9388E8),
      12: const Color(0xFF9388E8),
      18: const Color(0xFF9388E8),
      19: const Color(0xFFE85C5C),
      25: const Color(0xFF9388E8),
    };

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Januari',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Table(
              children: [
                const TableRow(
                  children: [
                    _DayText('SEN'),
                    _DayText('SEL'),
                    _DayText('RAB'),
                    _DayText('KAM'),
                    _DayText('JUM'),
                    _DayText('SAB'),
                    _DayText('MIN'),
                  ],
                ),
                ..._buildCalendarRows(markedDates),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<TableRow> _buildCalendarRows(Map<int, Color> markedDates) {
    List<TableRow> rows = [];
    List<int> days = List.generate(31, (index) => index + 1);
    int startWeekday = 6;

    List<Widget> currentRow = List.generate(
      startWeekday,
      (_) => const SizedBox(),
    );
    for (var day in days) {
      currentRow.add(_buildCalendarCell(day, markedDates[day]));
      if (currentRow.length == 7) {
        rows.add(TableRow(children: List.from(currentRow)));
        currentRow.clear();
      }
    }
    if (currentRow.isNotEmpty) {
      while (currentRow.length < 7) {
        currentRow.add(const SizedBox());
      }
      rows.add(TableRow(children: currentRow));
    }

    return rows;
  }

  Widget _buildCalendarCell(int day, Color? color) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: color ?? Colors.transparent,
        child: Text(
          '$day',
          style: TextStyle(
            color: color != null ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text('Keterangan', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _LegendItem(color: Color(0xFFE85C5C), label: 'Alpha'),
            SizedBox(width: 16),
            _LegendItem(color: Color(0xFF9388E8), label: 'Sakit'),
            SizedBox(width: 16),
            _LegendItem(color: Color(0xFFE8E38A), label: 'Izin'),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 99, 48),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ParentDashboard(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.home, size: 28, color: Colors.white),
                  SizedBox(height: 4),
                  Text(
                    'Beranda',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.person, size: 28, color: Colors.white),
                  SizedBox(height: 4),
                  Text(
                    'Profil',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DayText extends StatelessWidget {
  final String label;
  const _DayText(this.label);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 8, backgroundColor: color),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}
