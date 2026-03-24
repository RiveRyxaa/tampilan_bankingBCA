import 'package:flutter/material.dart';

const Color bcaBlue = Color(0xFF0066AE); 
const Color bcaTextBlue = Color(0xFF004481); 
const Color bcaCyan = Color(0xFF00A2E9); 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myBCA Replica',
      theme: ThemeData(
        primaryColor: bcaBlue,
        scaffoldBackgroundColor: bcaBlue,
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
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildTopHeader(),
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileSection(),
                      const SizedBox(height: 25),
                      _buildBalanceCard(),
                      const SizedBox(height: 35),
                      // Memanggil widget Menu Utama
                      _buildMainMenu(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text('my', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
              Text('BCA', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
            ],
          ),
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

  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('HALO,', style: TextStyle(color: bcaTextBlue, fontSize: 13)),
        const SizedBox(height: 5),
        const Text('MEYSANDI DWI SAPUTRA', style: TextStyle(color: bcaTextBlue, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Row(
          children: [
            const Text('BCA ID SA****7', style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(width: 8),
            Icon(Icons.visibility_off, color: Colors.grey[400], size: 18),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!, width: 1.5),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('Rekening: 406 - 216 - 5620', style: TextStyle(color: bcaCyan, fontSize: 14, fontWeight: FontWeight.w500)),
                    SizedBox(width: 5),
                    Icon(Icons.chevron_right, color: bcaCyan, size: 20),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text('IDR', style: TextStyle(color: bcaTextBlue, fontSize: 16, fontWeight: FontWeight.w500)),
                        SizedBox(width: 8),
                        Text('12,660,420.00', style: TextStyle(color: bcaTextBlue, fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Icon(Icons.visibility, color: Colors.grey[400], size: 22),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(13), bottomRight: Radius.circular(13)),
              gradient: LinearGradient(
                colors: [Color(0xFF004481), Color(0xFF3b5998)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('TheNew Gebyar', style: TextStyle(color: Colors.white, fontSize: 11, fontStyle: FontStyle.italic)),
                    Text('Hadiah BCA', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  ],
                ),
                Row(
                  children: const [
                    Text('Cek & Menangkan', style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(width: 5),
                    Icon(Icons.chevron_right, color: Colors.white, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET BARU TAHAP 3 ---

  // Bagian Menu Utama
  Widget _buildMainMenu() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMenuIcon(Icons.swap_horiz, 'Transfer', bcaBlue),
            _buildMenuIcon(Icons.show_chart, 'Welma', Colors.teal),
            _buildMenuIcon(Icons.health_and_safety, 'Proteksi', Colors.teal[300]!),
            _buildMenuIcon(Icons.shopping_bag, 'Lifestyle', bcaBlue, isNew: true),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMenuIcon(Icons.history_toggle_off, 'Paylater', Colors.orange),
            _buildMenuIcon(Icons.credit_card, 'Flazz', const Color(0xFF004481)),
            _buildMenuIcon(Icons.phone_android, 'Cardless', bcaBlue),
            _buildMenuIcon(Icons.more_horiz, 'Lainnya', Colors.grey[400]!),
          ],
        ),
      ],
    );
  }

  // Template Ikon Menu myBCA
  Widget _buildMenuIcon(IconData icon, String label, Color iconColor, {bool isNew = false}) {
    return SizedBox(
      width: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Ikon utama
              Icon(icon, color: iconColor, size: 38),
              
              // Jika ada badge "NEW" seperti di Lifestyle
              if (isNew)
                Positioned(
                  bottom: -5,
                  right: -10,
                  left: -10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'NEW',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13, 
              fontWeight: FontWeight.w500,
              color: bcaTextBlue, // Teks menu myBCA menggunakan biru tua
            ),
          ),
        ],
      ),
    );
  }
}