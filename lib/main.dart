import 'package:flutter/material.dart';

// Definisi warna khusus untuk myBCA
const Color bcaBlue = Color(0xFF0066AE); 
const Color bcaTextBlue = Color(0xFF004481); // Biru tua untuk teks nama & saldo
const Color bcaCyan = Color(0xFF00A2E9); // Biru muda cyan untuk nomor rekening

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
                // Menggunakan SingleChildScrollView agar layarnya bisa di-scroll ke bawah
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Memanggil widget Profil
                      _buildProfileSection(),
                      const SizedBox(height: 25),
                      // Memanggil widget Kartu Saldo
                      _buildBalanceCard(),
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

  // Header Atas (Logo & Ikon Kanan)
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

  // --- WIDGET BARU TAHAP 2 ---

  // Bagian Teks Sapaan & Nama
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

  // Bagian Kartu Saldo Utama
  Widget _buildBalanceCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // Menambahkan border tipis & shadow sesuai desain asli
        border: Border.all(color: Colors.grey[200]!, width: 1.5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Isi Bagian Atas Kartu (Rekening & Saldo)
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
          
          // Bagian Bawah Kartu (Banner Gradient Gebyar Hadiah)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(13), bottomRight: Radius.circular(13)),
              gradient: LinearGradient(
                colors: [Color(0xFF004481), Color(0xFF3b5998)], // Gradasi biru
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
}