import 'package:flutter/material.dart';
import 'package:aplikasi_hadirin/pages/login.dart';

class ChooseLoginRole extends StatefulWidget {
  const ChooseLoginRole({super.key});

  @override
  State<ChooseLoginRole> createState() => _ChooseLoginRoleState();
}

class _ChooseLoginRoleState extends State<ChooseLoginRole> {
  final PageController _controller = PageController();

  final List<Map<String, dynamic>> _roles = [
    {
      'title': 'Guru',
      'image': 'assets/images/guru.png',
    },
    {
      'title': 'Orang Tua',
      'image': 'assets/images/orangtua.png',
    },
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 50),
          const Text(
            'SELAMAT DATANG\nDI ABSENSI ONLINE\nSISWA SMPN 2 PORSEA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Login Sebagai?',
            style: TextStyle(
              color: Color(0xFF1B3C2F),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _roles.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  _roles[index]['image'],
                  height: 300,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _roles.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.green
                      : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B3C2F),
                minimumSize: const Size.fromHeight(45),
              ),
              onPressed: () {
                String selectedRole = _roles[_currentPage]['title'];
                print('Login sebagai: $selectedRole');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Login(
                            selectedRole: selectedRole,
                          )),
                );
              },
              child: Text(_roles[_currentPage]['title'],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
