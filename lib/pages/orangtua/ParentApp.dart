import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'notification.dart';
import 'ChildPermission.dart';
import 'AttendanceRecap.dart';
import 'Profil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ParentDashboard(),
      routes: {'/notifications': (context) => const NotificationScreen()},
    );
  }
}

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});

  static const double pieChartHeight = 130;
  static const double pieChartWeight = 1.5;
  static const double defaultLegendFontSize = 14;
  static const double legendSpacing = 12;
  static const double featureCardTitleFontSize = 16;
  static const double featureCardDescFontSize = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildCustomAppBar(context),
      body: _buildDashboardContent(context),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfilScreen(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.person,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Yonathan Purba',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Yonathan Purba',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
          _buildChildDataCard(),
          const SizedBox(height: 24),
          _buildAttendancePercentageCard(),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IzinAnakScreen()),
              );
            },
            child: _buildFeatureCard(
              context,
              "Form izin",
              "Form ini digunakan untuk mengirimkan surat izin kepada walikelas",
              Icons.edit_document,
              titleFontSize: 15,
              descFontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AttendanceRecap(
                    bulan: 'April',
                    data: [
                      {'tanggal': '2025-04-01', 'status': 'Hadir'},
                      {'tanggal': '2025-04-02', 'status': 'Izin'},
                      {'tanggal': '2025-04-03', 'status': 'Sakit'},
                      {'tanggal': '2025-04-04', 'status': 'Hadir'},
                    ],
                  ),
                ),
              );
            },
            child: _buildFeatureCard(
              context,
              "Lihat Rekapitulasi Absensi Anak",
              "Berikut adalah tampilan untuk melihat rekapitulasi kehadiran anak",
              Icons.list_alt,
              titleFontSize: 13,
              descFontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildDataCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Data Anak",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 24, thickness: 1, color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildParentInfoColumn(), _buildChildInfoColumn()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParentInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Nama Orang Tua :", style: TextStyle(fontSize: 14)),
        SizedBox(height: 4),
        Text(
          "Yonpur",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 16),
        Text("Telepon :", style: TextStyle(fontSize: 14)),
        SizedBox(height: 4),
        Text(
          "081234567890",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildChildInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Nama Anak :", style: TextStyle(fontSize: 14)),
        SizedBox(height: 4),
        Text(
          "Josua Purba",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 16),
        Text("Kelas :", style: TextStyle(fontSize: 14)),
        SizedBox(height: 4),
        Text(
          "IX - A",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildAttendancePercentageCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Persentasi kehadiran Anak",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 24, thickness: 1, color: Colors.grey),
            Row(
              children: [
                Expanded(flex: 1, child: _buildAttendanceLegend()),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: pieChartHeight,
                    child: _buildAttendancePieChart(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "Chart Kehadiran Siswa",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceLegend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLegendItem("HADIR", "82%", Colors.green, fontSize: 12),
        SizedBox(height: legendSpacing),
        _buildLegendItem("IZIN", "7%", Colors.blue, fontSize: 12),
        SizedBox(height: legendSpacing),
        _buildLegendItem("SAKIT", "5%", Colors.orange, fontSize: 12),
        SizedBox(height: legendSpacing),
        _buildLegendItem("ABSEN", "6%", Colors.red, fontSize: 12),
      ],
    );
  }

  Widget _buildAttendancePieChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 30 * pieChartWeight,
        sections: [
          _buildPieSection(82, Colors.green, "82%"),
          _buildPieSection(7, Colors.blue, "7%"),
          _buildPieSection(5, Colors.orange, "5%"),
          _buildPieSection(6, Colors.red, "6%"),
        ],
      ),
    );
  }

  PieChartSectionData _buildPieSection(
    double value,
    Color color,
    String title,
  ) {
    return PieChartSectionData(
      value: value,
      color: color,
      title: title,
      radius: 13 * pieChartWeight,
      titleStyle: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.bold,
        color: color == Colors.green
            ? const Color.fromARGB(255, 237, 234, 234)
            : Colors.white,
      ),
      borderSide: BorderSide(color: Colors.white, width: 2 * pieChartWeight),
    );
  }

  Widget _buildLegendItem(
    String label,
    String value,
    Color color, {
    double fontSize = 14,
  }) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
    IconData icon, {
    double? titleFontSize,
    double? descFontSize,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 28, color: Colors.blue),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize ?? featureCardTitleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: descFontSize ?? featureCardDescFontSize,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
              onTap: () {},
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfilScreen(),
                  ),
                );
              },
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
