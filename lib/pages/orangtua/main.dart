import 'package:flutter/material.dart';
import 'ParentApp.dart'; // Import ParentApp sebagai home
import 'notification.dart'; // Import halaman notifikasi
import 'ChildPermission.dart'; // Import halaman Form Izin
import 'AttendanceRecap.dart'; // Import halaman rekap absensi
import 'Child_Daily_Recap.dart'; // Import halaman rekap harian anak

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ParentDashboard(),
        '/notifications': (context) => const NotificationScreen(),
        '/izin': (context) => const IzinAnakScreen(),
        '/attendance': (context) =>
            const AttendanceRecap(bulan: "", data: null),
        '/daily-recap': (context) => ChildDailyRecap(
              bulan: ModalRoute.of(context)!.settings.arguments
                  as String, // Ambil data bulan
              data: null, // Sesuaikan jika perlu
            ),
      },
    );
  }
}
