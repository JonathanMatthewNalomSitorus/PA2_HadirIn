import 'package:flutter/material.dart';
import 'ParentApp.dart';
import 'detail_notification.dart'; // pastikan file ini ada

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildCustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 160),
        child: _buildNotificationContent(context),
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

  Widget _buildNotificationContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateSection(context, 'Hari ini', [
            _buildNotificationItem(
              context,
              'Panih Margareth Manurung tidak mengikuti kegiatan akademik',
              '06.50 - 8 Maret 2025',
              isFirst: true,
            ),
            _buildNotificationItem(
              context,
              'Panih Margareth Manurung tidak mengikuti kegiatan akademik',
              '06.35 - 8 Maret 2025',
            ),
          ]),
          _buildDateSection(context, 'Kemarin', [
            _buildNotificationItem(
              context,
              'Panih Margareth Manurung tidak mengikuti kegiatan akademik',
              '06.35 - 7 Maret 2025',
            ),
            _buildNotificationItem(
              context,
              'Panih Margareth Manurung tidak mengikuti kegiatan akademik',
              '06.35 - 7 Maret 2025',
            ),
          ]),
          _buildDateSection(context, 'Minggu ini', [
            _buildNotificationItem(
              context,
              'Panih Margareth Manurung tidak mengikuti kegiatan akademik',
              '06.35 - 6 Maret 2025',
            ),
            _buildNotificationItem(
              context,
              'Panih Margareth Manurung tidak mengikuti kegiatan akademik',
              '06.35 - 6 Maret 2025',
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildDateSection(
    BuildContext context,
    String title,
    List<Widget> notifications,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Column(children: notifications),
      ],
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    String message,
    String time, {
    bool isFirst = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const NotificationDetailScreen(), // navigasi ke detail
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.notifications,
                  color: isFirst ? Colors.red : Colors.grey,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pemberitahuan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isFirst ? Colors.black : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 14,
                          color: isFirst ? Colors.black : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          time,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.green, thickness: 1),
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
