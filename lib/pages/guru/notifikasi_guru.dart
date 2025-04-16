import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:aplikasi_hadirin/pages/guru/rekapitulasi_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/profil_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/homepage_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/jadwal_kehadiran_guru.dart';

class NotifikasiGuru extends StatefulWidget {
  const NotifikasiGuru({super.key});

  @override
  State<NotifikasiGuru> createState() => _NotifikasiGuruState();
}

class _NotifikasiGuruState extends State<NotifikasiGuru> {
  int _selectedIndex = 3;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Header
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
                      "Notifikasi",
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

          // Body Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                SectionTitle(title: "Hari ini"),
                NotificationTile(
                  isActive: true,
                  title: "Permohonan Surat Sakit dari Orang Tua Rakhel Simatupang",
                  time: "06.50 – 8 Maret 2025",
                ),
                NotificationTile(
                  title: "Permohonan Surat Sakit dari Orang Tua Rahing Simatupang",
                  time: "06.35 – 8 Maret 2025",
                ),
                SectionTitle(title: "Kemarin"),
                NotificationTile(
                  title: "Permohonan Surat Sakit dari Orang Tua Rahing Simatupang",
                  time: "06.35 – 7 Maret 2025",
                ),
                SectionTitle(title: "Minggu ini"),
                NotificationTile(
                  title: "Permohonan Surat Sakit dari Orang Tua Rahing Simatupang",
                  time: "06.35 – 6 Maret 2025",
                ),
                NotificationTile(
                  title: "Permohonan Surat Sakit dari Orang Tua Rahing Simatupang",
                  time: "06.35 – 6 Maret 2025",
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
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
            selectedItemColor: const Color.fromARGB(255, 76, 175, 80),
            unselectedItemColor: Colors.white,
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
                label: 'Riwayat',
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

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String time;
  final bool isActive;

  const NotificationTile({
    super.key,
    required this.title,
    required this.time,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (isActive)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.notifications,
            color: isActive ? const Color(0xFF0FBF61) : Colors.grey,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pemberitahuan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF0068FF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
