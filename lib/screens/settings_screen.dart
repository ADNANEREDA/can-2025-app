// lib/screens/settings_screen.dart

import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../models/city_model.dart';
import '../models/team_model.dart';
import '../main.dart';
import 'edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  final String userName;
  final City userCity;
  final Team userTeam;

  const SettingsScreen({
    super.key,
    required this.userName,
    required this.userCity,
    required this.userTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMarocDark,
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: Column(
              children: [
                Container(
                   padding: const EdgeInsets.all(4),
                   decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kMarocRed, width: 3)),
                   child: CircleAvatar(
                     radius: 50,
                     backgroundImage: AssetImage(userTeam.flagPath),
                     backgroundColor: Colors.grey.shade800,
                   ),
                ),
                const SizedBox(height: 16),
                Text(userName, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.grey.shade800, borderRadius: BorderRadius.circular(20)),
                  child: Text("Team: ${userTeam.name}", style: TextStyle(color: Colors.grey.shade300, fontSize: 14)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          _buildSectionTitle("Profile Management"),
          _buildActionTile(
            title: "Edit Profile",
            subtitle: "Change Name, City or Team",
            icon: Icons.edit,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(
                    currentName: userName,
                    currentCity: userCity,
                    currentTeam: userTeam,
                  ),
                ),
              );
            }
          ),
          const SizedBox(height: 30),
          _buildSectionTitle("Danger Zone"),
          Container(
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.red.withOpacity(0.3)),
            ),
            child: _buildActionTile(
              title: "Reset Application",
              subtitle: "Clear all data and restart",
              icon: Icons.delete_forever_outlined,
              color: Colors.red,
              onTap: () {
                _showResetConfirmation(context);
              }
            ),
          ),
          const SizedBox(height: 40),
          const Center(child: Text("Version 1.0.0", style: TextStyle(color: Colors.grey, fontSize: 12))),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 4),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(color: kMarocRed, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.2),
      ),
    );
  }

  Widget _buildActionTile({required String title, String? subtitle, required IconData icon, required VoidCallback onTap, Color color = Colors.white}) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: Colors.grey.shade900, 
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
        child: Icon(icon, color: color, size: 22),
      ),
      title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)) : null,
      trailing: Icon(Icons.arrow_forward_ios, color: color.withOpacity(0.5), size: 16),
    );
  }

  void _showResetConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text("Reset App?", style: TextStyle(color: Colors.white)),
        content: const Text("Are you sure? This will delete your profile.", style: TextStyle(color: Colors.grey)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel", style: TextStyle(color: Colors.grey))),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false);
            },
            child: const Text("Reset", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
