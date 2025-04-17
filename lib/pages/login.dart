import 'package:aplikasi_hadirin/pages/guru/homepage_guru.dart';
import 'package:aplikasi_hadirin/pages/orangtua/ParentApp.dart';
import 'package:aplikasi_hadirin/pages/orangtua/homepage_orangtua.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String selectedRole;
  const Login({super.key, required this.selectedRole});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login sebagai ${widget.selectedRole}"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const Text(
              "Log In",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/logo_hadirin.png',
              height: 200,
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline),
                hintText: 'Username',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: const Icon(Icons.visibility),
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (widget.selectedRole == "Guru") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomepageGuru()),
                  );
                } else if (widget.selectedRole == "Orang Tua") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ParentDashboard()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Log In sebagai ${widget.selectedRole}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
