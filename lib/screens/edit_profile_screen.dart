// lib/screens/edit_profile_screen.dart

import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../data/mock_database.dart';
import '../models/city_model.dart';
import '../models/team_model.dart';
import 'dashboard_screen.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final City currentCity;
  final Team currentTeam;

  const EditProfileScreen({
    super.key,
    required this.currentName,
    required this.currentCity,
    required this.currentTeam,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late City _selectedCity;
  late Team _selectedTeam;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _selectedCity = widget.currentCity;
    _selectedTeam = widget.currentTeam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMarocDark,
      appBar: AppBar(
        title: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kMarocRed, width: 3),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade800,
                      backgroundImage: AssetImage(_selectedTeam.flagPath),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: kMarocRed, shape: BoxShape.circle),
                      child: const Icon(Icons.edit, size: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            _buildSectionTitle("My Name"),
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade900,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.person_outline, color: kMarocRed),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle("My Host City"),
            _buildSelectorTile(
              title: _selectedCity.name,
              icon: Icons.location_city,
              imagePath: _selectedCity.imagePath,
              onTap: () => _showCitySelectionSheet(),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle("My Team"),
            _buildSelectorTile(
              title: _selectedTeam.name,
              icon: Icons.flag,
              imagePath: _selectedTeam.flagPath,
              isTeam: true,
              onTap: () => _showTeamSelectionSheet(),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _saveAndExit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kMarocRed,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("SAVE CHANGES", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveAndExit() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(
          userName: _nameController.text,
          userCity: _selectedCity,
          userTeam: _selectedTeam,
        ),
      ),
      (route) => false,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: kMarocGreen),
              SizedBox(width: 10),
              Text("Success !"),
            ],
          ),
          content: const Text("Your profile has been successfully updated."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "OK",
                style: TextStyle(color: kMarocRed, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: TextStyle(color: Colors.grey.shade400, fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSelectorTile({required String title, required IconData icon, required VoidCallback onTap, String? imagePath, bool isTeam = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: Row(
          children: [
            if (imagePath != null)
              isTeam 
               ? ClipOval(child: Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.cover))
               : ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(imagePath, width: 50, height: 40, fit: BoxFit.cover))
            else
              Icon(icon, color: kMarocRed),
            const SizedBox(width: 16),
            Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
            const Icon(Icons.edit, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }

  void _showCitySelectionSheet() {
    showModalBottomSheet(
      context: context, backgroundColor: kMarocDark,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: mockCities.length,
          itemBuilder: (context, index) {
            final city = mockCities[index];
            return ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(city.imagePath)),
              title: Text(city.name, style: const TextStyle(color: Colors.white)),
              onTap: () { setState(() => _selectedCity = city); Navigator.pop(context); },
              trailing: _selectedCity.id == city.id ? const Icon(Icons.check, color: kMarocRed) : null,
            );
          },
        ),
      ),
    );
  }

  void _showTeamSelectionSheet() {
    showModalBottomSheet(
      context: context, backgroundColor: kMarocDark, isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7, maxChildSize: 0.9, expand: false,
        builder: (_, c) => Container(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            controller: c, itemCount: mockTeams.length,
            itemBuilder: (context, index) {
              final team = mockTeams[index];
              return ListTile(
                leading: CircleAvatar(backgroundImage: AssetImage(team.flagPath)),
                title: Text(team.name, style: const TextStyle(color: Colors.white)),
                onTap: () { setState(() => _selectedTeam = team); Navigator.pop(context); },
                trailing: _selectedTeam.id == team.id ? const Icon(Icons.check, color: kMarocRed) : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
