// lib/screens/city_guide/place_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants.dart';
import '../../models/place_model.dart';

class PlaceDetailScreen extends StatelessWidget {
  final Place place;

  const PlaceDetailScreen({super.key, required this.place});

  Future<void> _launchAction(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $urlString';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cannot open this link on simulator/device.")),
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
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            backgroundColor: kMarocDark,
            elevation: 0,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back_ios_new, size: 20),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    place.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => Container(color: Colors.grey.shade800, child: const Icon(Icons.image, size: 50, color: Colors.grey)),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter, end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87], stops: [0.6, 1.0]
                      ),
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
                  Text(place.name, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, height: 1.2)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: kMarocRed, borderRadius: BorderRadius.circular(20)),
                        child: Text(place.type.name.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.amber, size: 22),
                      const SizedBox(width: 8),
                      Text("${place.rating} / 5.0", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text("About", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(place.description, style: TextStyle(color: Colors.grey.shade300, fontSize: 16, height: 1.6)),
                  const SizedBox(height: 30),
                  Text("Location", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: kMarocRed, size: 24),
                      const SizedBox(width: 12),
                      Expanded(child: Text(place.locationInfo, style: TextStyle(color: Colors.grey.shade300, fontSize: 16, height: 1.4))),
                    ],
                  ),
                  const SizedBox(height: 50),
                  if (place.phoneNumber != null || place.mapUrl != null)
                    Row(
                      children: [
                        if (place.phoneNumber != null)
                          Expanded(
                            child: _buildActionButton(
                              context,
                              icon: Icons.phone_in_talk,
                              label: "Call",
                              color: Colors.green.shade600,
                              onTap: () => _launchAction(context, "tel:${place.phoneNumber}"),
                            ),
                          ),
                        if (place.phoneNumber != null && place.mapUrl != null)
                          const SizedBox(width: 16),
                        if (place.mapUrl != null)
                          Expanded(
                            child: _buildActionButton(
                              context,
                              icon: Icons.map_outlined,
                              label: "Directions",
                              color: Colors.blue.shade600,
                              onTap: () => _launchAction(context, place.mapUrl!),
                            ),
                          ),
                      ],
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

  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return SizedBox(
      height: 55,
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 5,
        ),
        icon: Icon(icon, size: 24),
        label: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
