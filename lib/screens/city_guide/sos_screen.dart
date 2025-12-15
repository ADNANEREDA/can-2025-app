// lib/screens/city_guide/sos_screen.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants.dart';
import '../../models/city_model.dart';

class SosScreen extends StatelessWidget {
  final City city;

  const SosScreen({super.key, required this.city});

  Future<void> _makePhoneCall(BuildContext context, String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      if (!await launchUrl(launchUri)) {
        throw 'Could not launch $phoneNumber';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cannot make calls on simulator.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMarocDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Emergency & Help", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: kMarocRed),
                const SizedBox(width: 8),
                Text("You are in ${city.name}, Morocco", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16)),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "National Emergency Numbers",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
             Text(
              "Tap to call directly. Free of charge.",
              style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
            ),
            const SizedBox(height: 30),

            _buildEmergencyButton(
              context,
              title: "POLICE / POLICE SECOURS",
              subtitle: "For immediate danger or crime.",
              number: "19",
              icon: Icons.local_police,
              color: Colors.blue.shade800,
            ),

            const SizedBox(height: 20),

            _buildEmergencyButton(
              context,
              title: "AMBULANCE & FIRE",
              subtitle: "Medical emergency or fire.",
              number: "15",
              icon: Icons.medical_services_outlined,
              color: kMarocRed,
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.withOpacity(0.3))
              ),
              child: Row(
                children: [
                  const Icon(Icons.lightbulb_outline, color: Colors.amber),
                  const SizedBox(width: 12),
                  Expanded(child: Text("Tip: Keep your embassy contact number handy.", style: TextStyle(color: Colors.amber.shade300, fontSize: 13))),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyButton(BuildContext context, {required String title, required String subtitle, required String number, required IconData icon, required Color color}) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: () => _makePhoneCall(context, number),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          elevation: 8,
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18)),
                  Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.call, color: Colors.white),
                Text(number, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
