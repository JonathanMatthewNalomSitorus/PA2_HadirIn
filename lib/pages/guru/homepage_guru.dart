import 'package:aplikasi_hadirin/pages/guru/detailkelas_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/notifikasi_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/riwayat_kehadiran_guru.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:aplikasi_hadirin/pages/guru/rekapitulasi_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/profil_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/jadwal_kehadiran_guru.dart';

class HomepageGuru extends StatefulWidget {
  const HomepageGuru({super.key});

  @override
  State<HomepageGuru> createState() => _HomepageGuruState();
}

class _HomepageGuruState extends State<HomepageGuru> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      // tetap di halaman ini
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
      backgroundColor: const Color(0xFFF5F5F5),
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
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileSection(),
                _buildScheduleSection(),
                _buildAbsensiStatusCard(),
                _buildDaftarAbsensiCard(),
                _buildSuratIzinCard(),
              ],
            ),
          ))
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
                    label: 'Riwayat'),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.user, size: 20), label: 'Profil'),
              ],
            ),
          )),
    );
  }

  Widget _buildProfileSection() {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: const Text('Jonathan Sitorus',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B3C2F))),
      subtitle: const Text('NIP : 19780515 2005 1 002'),
      // trailing: const Icon(Icons.notifications),
      trailing: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NotifikasiGuru()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        iconColor: Colors.black,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      child: const Icon(Icons.notifications),
      ),
    );
  }

  Widget _buildScheduleSection() {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('JADWAL HARI INI',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF1B3C2F))),
            const SizedBox(height: 12),
            _buildScheduleRow(
                '7-1', '08.10 - 09.20', 'Selesai', Color(0xFF1B3C2F)),
            _buildScheduleRow(
                '8-2', '09.20 - 10.15', 'Selesai', Color(0xFF1B3C2F)),
            _buildScheduleRow(
                '9-1', '10.15 - 11.20', 'Selesai', Color(0xFF1B3C2F)),
            _buildScheduleRow(
                '9-2', '11.20 - 12.20', 'Sedang Berjalan', Colors.blueAccent),
            _buildScheduleRow('9-3', '12.55 - 13.30', 'Mendatang', Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleRow(
      String kelas, String jam, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(kelas),
          Text(jam),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 130),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                status,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAbsensiStatusCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Senin | 19 Januari 2025",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Divider(thickness: 1, height: 24),
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('SKEMA ABSENSI : ',
                        style: TextStyle(color: Colors.grey)),
                    const Text('Absen Kelas 9-2'),
                    const SizedBox(height: 8),
                    const Text('JADWAL ABSENSI',
                        style: TextStyle(color: Colors.grey)),
                    const Text('09.00 - 11.00'),
                    const SizedBox(height: 8),
                    const Text('STATUS KEHADIRAN : ',
                        style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.notifications_active,
                              color: Colors.white, size: 16),
                          SizedBox(height: 4),
                          Text('Absen!', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('SELESAI DALAM : ',
                        style: TextStyle(color: Colors.grey)),
                    const Text('01.19.44',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(0),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailkelasGuru()),
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF1B3C2F),
                  child: const Text('9-2',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
              ),
              const SizedBox(width: 28),
            ])
          ],
        ),
      ),
    );
  }

  Widget _buildDaftarAbsensiCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('Daftar Absensi Kelas 9-2',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('SKEMA ABSENSI : ',
                          style: TextStyle(color: Colors.grey)),
                      Text('Absen Kelas 9-2'),
                      SizedBox(height: 12),
                      Text('JADWAL ABSENSI : ',
                          style: TextStyle(color: Colors.grey)),
                      Text('09.00 - 11.00')
                    ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('TOTAL SISWA : ',
                        style: TextStyle(color: Colors.grey)),
                    Text('34 SISWA'),
                    SizedBox(height: 12),
                    Text('MATA PELAJARAN : ',
                        style: TextStyle(color: Colors.grey)),
                    Text('BAHASA INDONESIA',
                        style: TextStyle(color: Colors.green)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text("Cek Kehadiran",
                        style: TextStyle(color: Colors.white))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuratIzinCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const ListTile(
          title: Text('lampiran Surat Izin'),
          subtitle: Text('Tahun Ajaran 2022/2023'),
          trailing: Icon(Icons.attach_file)),
    );
  }
}
