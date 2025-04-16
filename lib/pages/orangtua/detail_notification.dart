import 'package:flutter/material.dart';
import 'ParentApp.dart';

class NotificationDetailScreen extends StatelessWidget {
  const NotificationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildCustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 160,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: _buildNotificationDetail(),
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
                    'Notifikasi',
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
                    onTap: () {
                      Navigator.pop(context);
                    },
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

  Widget _buildNotificationDetail() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Pemberitahuan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Dear orangtua,\n\n'
            'Bersama ini kami informasikan bahwa anak anda, Panih Margareth Manurung tidak hadir dikelas '
            'hari ini untuk mengikuti kegiatan akademik, 21 Maret 2025 tanpa keterangan yang jelas. Mohon segera '
            'konfirmasi alasan ketidakhadiran ini. Jika memang ada keperluan mendesak, harap berikan surat izin melalui form izin.\n\n'
            'Jika ini terjadi berulang kali, pihak sekolah akan mengambil langkah lebih lanjut sesuai dengan '
            'peraturan yang berlaku.\n\n'
            'Terimakasih atas perhatian dan kerjasamanya.\n\n'
            'Hormat kami,\n'
            'Stefa Rajagukguk',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
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
