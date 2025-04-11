import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RekapitulasiGuru extends StatefulWidget {
  const RekapitulasiGuru({super.key});

  @override
  State<RekapitulasiGuru> createState() => _RekapitulasiGuruState();
}

class _RekapitulasiGuruState extends State<RekapitulasiGuru> {
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
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.home, size: 20), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.checkSquare, size: 20), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.list, size: 20), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.history, size: 20), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(LucideIcons.user, size: 20), label: ''),
              ],
            ),
          )),
    );
  }
}
