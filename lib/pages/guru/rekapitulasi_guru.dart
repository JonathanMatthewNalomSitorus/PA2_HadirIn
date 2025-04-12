import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:aplikasi_hadirin/pages/guru/riwayat_kehadiran_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/profil_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/jadwal_kehadiran_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/homepage_guru.dart';

class RekapitulasiGuru extends StatefulWidget {
  const RekapitulasiGuru({super.key});

  @override
  State<RekapitulasiGuru> createState() => _RekapitulasiGuruState();
}

class _RekapitulasiGuruState extends State<RekapitulasiGuru> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomepageGuru()));
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RekapitulasiGuru()));
    } else if (index == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => JadwalKehadiranGuru()));
    } else if (index == 3) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => RiwayatKehadiranGuru()));
    } else if (index == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilGuru()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Ubah warna background utama
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFEADFC9),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF205040)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Lampiran Rekapitulasi",
                      style: TextStyle(
                        color: Color(0xFF205040),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  const SizedBox(height: 16),
                  DataRekapitulasiWidget(
                    kelas: 'Kelas 7 - 1',
                    tahunAjaran: 'Tahun ajaran 2022/2023',
                    imageUrl: 'assets/images/rekap.png',
                  ),
                  const SizedBox(height: 16),
                  DataRekapitulasiWidget(
                    kelas: 'Kelas 7 - 2',
                    tahunAjaran: 'Tahun ajaran 2022/2023',
                    imageUrl: 'assets/images/rekap.png',
                  ),
                  const SizedBox(height: 16),
                  DataRekapitulasiWidget(
                    kelas: 'Kelas 7 - 3',
                    tahunAjaran: 'Tahun ajaran 2022/2023',
                    imageUrl: 'assets/images/rekap.png',
                  ),
                  const SizedBox(height: 16),
                  DataRekapitulasiWidget(
                    kelas: 'Kelas 8 - 1',
                    tahunAjaran: 'Tahun ajaran 2022/2023',
                    imageUrl: 'assets/images/rekap.png',
                  ),
                  const SizedBox(height: 16),
                  DataRekapitulasiWidget(
                    kelas: 'Kelas 8 - 2',
                    tahunAjaran: 'Tahun ajaran 2022/2023',
                    imageUrl: 'assets/images/rekap.png',
                  ),
                  const SizedBox(height: 16),
                  DataRekapitulasiWidget(
                    kelas: 'Kelas 9 - 1',
                    tahunAjaran: 'Tahun ajaran 2022/2023',
                    imageUrl: 'assets/images/rekap.png',
                  ),
                  const SizedBox(height: 16),
                  DataRekapitulasiWidget(
                    kelas: 'Kelas 9 - 2',
                    tahunAjaran: 'Tahun ajaran 2022/2023',
                    imageUrl: 'assets/images/rekap.png',
                  ),
                  const SizedBox(height: 16),
                ],
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
            selectedItemColor: const Color(0xFF94BCAC),
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
                  icon: Icon(LucideIcons.history, size: 20),
                  label: 'Riwayat Kehadiran'),
              BottomNavigationBarItem(
                  icon: Icon(LucideIcons.user, size: 20), label: 'Profil'),
            ],
          ),
        ),
      ),
    );
  }
}

class DataRekapitulasiWidget extends StatelessWidget {
  final String kelas;
  final String tahunAjaran;
  final String imageUrl;

  DataRekapitulasiWidget({
    required this.kelas,
    required this.tahunAjaran,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF94BCAC),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kelas,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  tahunAjaran,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
