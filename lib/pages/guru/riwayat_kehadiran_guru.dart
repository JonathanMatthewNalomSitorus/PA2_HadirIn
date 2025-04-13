import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:aplikasi_hadirin/pages/guru/rekapitulasi_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/profil_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/homepage_guru.dart';
import 'package:aplikasi_hadirin/pages/guru/jadwal_kehadiran_guru.dart';

class RiwayatKehadiranGuru extends StatefulWidget {
  const RiwayatKehadiranGuru({super.key});

  @override
  State<RiwayatKehadiranGuru> createState() => _RiwayatKehadiranGuruState();
}

class _RiwayatKehadiranGuruState extends State<RiwayatKehadiranGuru>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 3;
  late TabController _tabController;

  final List<String> absenList = ['7-1', '7-2', '7-3', '7-4', '8-1', '8-2', '8-3', '8-4', '9-1', '9-2', '9-3', '9-4'];
  final List<String> izinList = ['7-1', '7-3', '8-1', '8-4', '9-2'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
                      "Riwayat Rekapitulasi",
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

          // TabBar
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              labelColor: Colors.green[800],
              unselectedLabelColor: Colors.black54,
              tabs: const [
                Tab(text: 'Absen'),
                Tab(text: 'Izin'),
              ],
            ),
          ),

          // TabBarView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildListView(absenList, 'Absen'),
                buildListView(izinList, 'Izin'),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation
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
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(LucideIcons.home, size: 20), label: 'Beranda'),
              BottomNavigationBarItem(
                  icon: Icon(LucideIcons.checkSquare, size: 20), label: 'Rekapitulasi'),
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

  Widget buildListView(List<String> list, String type) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return AbsenTile(label: list[index], type: type);
      },
    );
  }
}

class AbsenTile extends StatelessWidget {
  final String label;
  final String type;

  const AbsenTile({super.key, required this.label, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          type == 'Absen' ? Icons.event_busy : Icons.event_available,
          color: Colors.green,
        ),
        title: Text('Kelas $label'),
        subtitle: Text('Lihat riwayat $type'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Aksi saat tile diklik (nanti bisa diarahkan ke halaman detail)
        },
      ),
    );
  }
}
