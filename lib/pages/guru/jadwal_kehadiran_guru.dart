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
  int _selectedIndex = 0;

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
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Container(
            height: 280,
            decoration: const BoxDecoration(
                color: Color(0xFFEADFC9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
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
                    icon: Icon(LucideIcons.history, size: 20),
                    label: 'RIwayat Kehadiran'),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.user, size: 20), label: 'Profil'),
              ],
            ),
          )),
    );
  }
}
