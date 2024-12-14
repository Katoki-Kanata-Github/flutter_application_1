import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, color: Colors.white),
            const SizedBox(width: 5),
            // const Text("Dashboard", style: TextStyle(color: Colors.white)),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Selamat Datang di Dashboard!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Berikut adalah fitur-fitur yang tersedia:",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              _buildCarousel(),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildInfoSection(),
              const SizedBox(height: 24),
              // Grid dibungkus agar tetap responsif
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true, // Penting agar tidak memengaruhi scroll
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildFeatureCard(
                    icon: Icons.people,
                    title: "Pegawai",
                    color: Colors.blue,
                    onTap: () {
                      // Aksi ketika fitur diklik
                    },
                  ),
                  _buildFeatureCard(
                    icon: Icons.task_alt,
                    title: "Tugas",
                    color: Colors.green,
                    onTap: () {
                      // Aksi ketika fitur diklik
                    },
                  ),
                  _buildFeatureCard(
                    icon: Icons.calendar_today,
                    title: "Jadwal",
                    color: Colors.orange,
                    onTap: () {
                      // Aksi ketika fitur diklik
                    },
                  ),
                  _buildFeatureCard(
                    icon: Icons.bar_chart,
                    title: "Laporan",
                    color: Colors.red,
                    onTap: () {
                      // Aksi ketika fitur diklik
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    final List<Map<String, String>> carouselItems = [
      {"text": "Selamat Datang!", "image": "assets/images/welcome.png"},
      {
        "text": "Fitur Baru: Laporan Pegawai",
        "image": "assets/images/report.png"
      },
      {
        "text": "Tugas Baru Telah Ditambahkan",
        "image": "assets/images/tasks.png"
      },
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: carouselItems.map((item) {
        return Stack(
          children: [
            // Background gambar
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(item["image"]!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Overlay gradient
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Teks
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  item["text"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildInfoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfoCard(title: "Pegawai", value: "25", color: Colors.blue),
        _buildInfoCard(title: "Tugas Aktif", value: "12", color: Colors.green),
        _buildInfoCard(
            title: "Jadwal Hari Ini", value: "3", color: Colors.orange),
      ],
    );
  }

  Widget _buildInfoCard(
      {required String title, required String value, required Color color}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Cari fitur atau data...",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color.withOpacity(0.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
