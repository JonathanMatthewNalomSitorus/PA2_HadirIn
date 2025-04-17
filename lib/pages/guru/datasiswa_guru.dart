import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:aplikasi_hadirin/pages/guru/rekapitulasi_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/profil_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/homepage_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/jadwal_kehadiran_guru.dart';

class DatasiswaGuru extends StatefulWidget {
  const DatasiswaGuru({super.key});

  @override
  State<DatasiswaGuru> createState() => _DatasiswaGuruState();
}

class _DatasiswaGuruState extends State<DatasiswaGuru> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() => _selectedIndex = index);

    Widget page;
    switch (index) {
      case 0:
        page = const HomepageGuru();
        break;
      case 1:
        page = const RekapitulasiGuru();
        break;
      case 2:
        page = const JadwalKehadiranGuru();
        break;
      case 4:
        page = const ProfilGuru();
        break;
      default:
        return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  final List<Map<String, String>> siswa = [
    {
      'nama': 'Robert Sinaga',
      'hadir': '27',
      'sakit': '1',
      'izin': '1',
      'absen': '1',
    },
    {
      'nama': 'Bima Sakti',
      'hadir': '29',
      'sakit': '0',
      'izin': '1',
      'absen': '0',
    },
    {
      'nama': 'Ayunda Mayudi',
      'hadir': '30',
      'sakit': '0',
      'izin': '0',
      'absen': '0',
    }
  ];

  Map<String, int> hitungTotal() {
    int hadir = 0, sakit = 0, izin = 0, absen = 0;
    for (var s in siswa) {
      hadir += int.parse(s['hadir'] ?? '');
      sakit += int.parse(s['sakit'] ?? '');
      izin += int.parse(s['izin'] ?? '');
      absen += int.parse(s['absen'] ?? '');
    }
    return {'hadir': hadir, 'sakit': sakit, 'izin': sakit, 'absen': absen};
  }

  @override
  Widget build(BuildContext context) {
    final total = hitungTotal();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: const Color(0xFFEADFC9),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Rekapitulasi Kehadiran Siswa",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1B3C2F),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '9-1',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 30,
                headingRowHeight: 40,
                dataRowHeight: 48,
                headingRowColor: MaterialStateProperty.all(Colors.green[100]),
                columns: const [
                  DataColumn(
                    label: Center(
                      child: Text('Nama', textAlign: TextAlign.center),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text('Hadir', textAlign: TextAlign.center),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text('Sakit', textAlign: TextAlign.center),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text('Izin', textAlign: TextAlign.center),
                    ),
                  ),
                  DataColumn(
                    label: Center(
                      child: Text('Absen', textAlign: TextAlign.center),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                  siswa.length,
                  (index) {
                    final s = siswa[index];
                    final totalHari = int.parse(s['hadir'] ?? '') +
                        int.parse(s['sakit'] ?? '') +
                        int.parse(s['izin'] ?? '') +
                        int.parse(s['absen'] ?? '');
                    final persenHadir =
                        (int.parse(s['hadir'] ?? '') / totalHari * 100)
                            .toStringAsFixed(1);

                    return DataRow(
                      color: s['absen'] != '0'
                          ? MaterialStateProperty.all(Colors.red[50])
                          : null,
                      cells: [
                        DataCell(Text(s['nama'] ?? '')),
                        DataCell(Text(s['hadir'] ?? '')),
                        DataCell(Text(s['sakit'] ?? '')),
                        DataCell(Text(s['izin'] ?? '')),
                        DataCell(Text(s['absen'] ?? '')),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF1B3C2F),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.white,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(LucideIcons.home, size: 20), label: 'Beranda'),
              BottomNavigationBarItem(
                  icon: Icon(LucideIcons.checkSquare, size: 20),
                  label: 'Rekapitulasi'),
              BottomNavigationBarItem(
                  icon: Icon(LucideIcons.list, size: 20), label: 'Jadwal'),
              BottomNavigationBarItem(
                  icon: Icon(LucideIcons.history, size: 20), label: 'Riwayat'),
              BottomNavigationBarItem(
                  icon: Icon(LucideIcons.user, size: 20), label: 'Profil'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAbsensiStatusCard(String title, int value, Color color) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            '$value',
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
