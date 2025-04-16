import 'package:flutter/material.dart';
import 'ParentApp.dart';
import 'Child_Daily_Recap.dart';

class AttendanceRecap extends StatelessWidget {
  final String bulan;
  final dynamic data;
  const AttendanceRecap({
    super.key,
    required this.bulan,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildCustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 160, left: 16, right: 16),
        child: _buildRekapitulasiContent(context),
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

  Widget _buildRekapitulasiContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Hasil Rekapitulasi Kehadiran Siswa',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(),
          const SizedBox(height: 16),
          const Text(
            'Jumlah Kehadiran siswa (per Tahun Ajaran 2024/2025)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5),
          ),
          const SizedBox(height: 8),
          _buildTable(context),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Detail Absensi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            Table(
              columnWidths: const {
                0: IntrinsicColumnWidth(),
                1: FixedColumnWidth(8),
                2: FlexColumnWidth(),
              },
              children: const [
                TableRow(
                  children: [
                    Text('Nama Anak'),
                    Text(':'),
                    Text('Panih Margareth Manurung'),
                  ],
                ),
                TableRow(
                  children: [SizedBox(height: 8), SizedBox(), SizedBox()],
                ),
                TableRow(children: [Text('Kelas'), Text(':'), Text('10 A')]),
                TableRow(
                  children: [SizedBox(height: 8), SizedBox(), SizedBox()],
                ),
                TableRow(
                  children: [Text('Total Kehadiran'), Text(':'), Text('90%')],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTable(BuildContext context) {
    final months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    final data = [
      [25, 2, 3, 1],
      [28, null, null, null],
      [null, 12, 3, 16],
      [18, 12, 1, null],
      [30, 1, null, null],
      [27, 1, 2, null],
      [25, 2, 3, 4],
      [31, 2, null, null],
      [31, null, null, null],
      [30, null, null, null],
      [31, 1, null, null],
      [28, 1, null, 2],
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Table(
        border: TableBorder.all(color: Colors.black54),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
          4: FlexColumnWidth(1),
        },
        children: [
          const TableRow(
            decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
            children: [
              _HeaderText('Bulan'),
              _HeaderText('Hadir'),
              _HeaderText('Sakit'),
              _HeaderText('Izin'),
              _HeaderText('Alpha'),
            ],
          ),
          for (int i = 0; i < months.length; i++)
            TableRow(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/daily-recap',
                      arguments: months[i], // Kirim bulan sebagai arguments
                    );
                  },
                  child: _buildTableCell(
                    months[i],
                    isBold: true,
                    color: Colors.blueAccent.withOpacity(0.1),
                  ),
                ),
                _buildTableCell(
                  data[i].isNotEmpty && data[i][0] != null
                      ? data[i][0].toString()
                      : '-',
                ),
                _buildTableCell(
                  data[i].length > 1 && data[i][1] != null
                      ? data[i][1].toString()
                      : '-',
                ),
                _buildTableCell(
                  data[i].length > 2 && data[i][2] != null
                      ? data[i][2].toString()
                      : '-',
                ),
                _buildTableCell(
                  data[i].length > 3 && data[i][3] != null
                      ? data[i][3].toString()
                      : '-',
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildTableCell(String value, {bool isBold = false, Color? color}) {
    return Container(
      color: color ?? Colors.transparent,
      padding: const EdgeInsets.all(6),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
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

class _HeaderText extends StatelessWidget {
  final String text;

  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
