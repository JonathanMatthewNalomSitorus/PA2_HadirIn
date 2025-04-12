import 'package:aplikasi_hadirin/pages/guru/riwayat_kehadiran_guru.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:aplikasi_hadirin/pages/guru/rekapitulasi_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/profil_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/homepage_guru.dart';

class JadwalKehadiranGuru extends StatefulWidget {
  const JadwalKehadiranGuru({super.key});

  @override
  State<JadwalKehadiranGuru> createState() => _JadwalKehadiranGuruState();
}

class _JadwalKehadiranGuruState extends State<JadwalKehadiranGuru> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomepageGuru()));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RekapitulasiGuru()));
    } else if (index == 2) {
      // Tetap di halaman ini
    } else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RiwayatKehadiranGuru()));
    } else if (index == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilGuru()));
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> jadwalMingguan = [
    {
      "hari": "Senin",
      "jadwal": [
        {"jam": "08:20 - 10:00", "kelas": "7-1"},
        {"jam": "10:20 - 12:00", "kelas": "8-1"},
        {"jam": "13:20 - 14.00", "kelas": "9-1"},
        {"jam": "15:20 - 16.00", "kelas": "9-2"},
      ]
    },
    {
      "hari": "Selasa",
      "jadwal": [
        {"jam": "08:20 - 10:00", "kelas": "7-1"},
        {"jam": "10:20 - 12:00", "kelas": "8-1"},
        {"jam": "13:20 - 14.00", "kelas": "9-1"},
        {"jam": "15:20 - 16.00", "kelas": "9-2"},
      ]
    },
    {
      "hari": "Rabu",
      "jadwal": [
        {"jam": "08:20 - 10:00", "kelas": "7-1"},
        {"jam": "10:20 - 12:00", "kelas": "8-1"},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 24),
            decoration: const BoxDecoration(
              color: Color(0xFFEADFC9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Jadwal',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B3C2F),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Semester 2\nT.A. 2023/2024',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1B3C2F),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: jadwalMingguan.length,
              itemBuilder: (context, index) {
                final hari = jadwalMingguan[index]["hari"];
                final jadwal = List<Map<String, String>>.from(jadwalMingguan[index]["jadwal"]);
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hari,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B3C2F),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...jadwal.map(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item["jam"] ?? "",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Container(
                                  constraints: const BoxConstraints(minWidth: 70),
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                  color: Color(0xFF5DAD6E),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  item["kelas"] ?? "",
                                  style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                               ),
                              ),
                            ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
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
                icon: Icon(LucideIcons.home, size: 20),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.checkSquare, size: 20),
                label: 'Rekapitulasi',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.list, size: 20),
                label: 'Jadwal',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.history, size: 20),
                label: 'Riwayat Kehadiran',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.user, size: 20),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
