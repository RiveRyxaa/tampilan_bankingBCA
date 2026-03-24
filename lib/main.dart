import 'package:flutter/material.dart';

// Karena kita hanya pakai 1 file, semua kode warna, tema, dan UI akan ada di sini.
const Color bcaBlue = Color(0xFF0066AE); // Warna biru khas myBCA
const Color bgWhite = Color(0xFFF8F9FA); // Warna background agak abu-abu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan tulisan debug
      title: 'myBCA Replica',
      theme: ThemeData(
        primaryColor: bcaBlue,
        scaffoldBackgroundColor: bcaBlue, // Background luar warna biru
        useMaterial3: true,
      ),
      home: const MyBcaScreen(),
    );
  }
}

class MyBcaScreen extends StatelessWidget {
  const MyBcaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea agar header tidak tertutup status bar HP
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Memanggil fungsi pembuatan Header Atas
            _buildTopHeader(),
            
            // Sisa layar ke bawah dibuat menjadi putih dengan sudut atas melengkung
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Tahap 1: Kerangka Dasar myBCA',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat Header Atas (Logo myBCA & Ikon)
  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Teks Logo myBCA
          Row(
            children: const [
              Text(
                'my',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic, // myBCA khas dengan tulisan miring
                ),
              ),
              Text(
                'BCA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          // Deretan Ikon Kanan (Headset, Setting, Logout)
          Row(
            children: const [
              Icon(Icons.headset_mic, color: Colors.white, size: 26),
              SizedBox(width: 15),
              Icon(Icons.settings, color: Colors.white, size: 26),
              SizedBox(width: 15),
              Icon(Icons.logout, color: Colors.white, size: 26),
            ],
          )
        ],
      ),
    );
  }
}