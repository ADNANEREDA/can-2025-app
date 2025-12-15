// lib/screens/city_guide/stadium_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants.dart';
import '../../models/city_model.dart';

class StadiumDetailScreen extends StatelessWidget {
  final City city;

  const StadiumDetailScreen({super.key, required this.city});

  Future<void> _launchMap(BuildContext context) async {
    if (city.stadiumMapUrl.isEmpty) {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Map link not available yet.")));
       return;
    }

    final Uri url = Uri.parse(city.stadiumMapUrl);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cannot open maps on simulator.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMarocDark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: kMarocDark,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(city.stadiumName, 
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, shadows: [Shadow(color: Colors.black, blurRadius: 10)]),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    city.stadiumImage,
                    fit: BoxFit.cover,
                    errorBuilder: (c,e,s) => Container(color: Colors.grey.shade800, child: const Icon(Icons.stadium, size: 50, color: Colors.grey)),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black87], stops: [0.6, 1.0]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: kMarocRed, size: 28),
                      const SizedBox(width: 12),
                      const Text("Stadium Guide", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    city.stadiumDescription,
                    style: TextStyle(color: Colors.grey.shade300, fontSize: 16, height: 1.6),
                  ),
                  const SizedBox(height: 40),
                  _buildInfoTile(Icons.access_time, "Opening Time", "Gates open 3 hours before kick-off."),
                  _buildInfoTile(Icons.security, "Security Rules", "No bags larger than A4 size. Mandatory search."),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () => _launchMap(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      icon: const Icon(Icons.directions, size: 28),
                      label: const Text("GET DIRECTIONS TO STADIUM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
