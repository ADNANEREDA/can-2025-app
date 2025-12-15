// lib/screens/onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/constants.dart';
import '../data/mock_database.dart';
import '../models/city_model.dart';
import '../models/team_model.dart';
import 'dashboard_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final TextEditingController _nameController = TextEditingController();
  City? _selectedCity;
  Team? _selectedTeam;

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void dispose() {
    _nameController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Setup Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/bg_dashboard.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          )
          .animate()
          .scale(begin: const Offset(1.05, 1.05), end: const Offset(1.0, 1.0), duration: 5.seconds),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                colors: [kMarocDark.withOpacity(0.6), kMarocDark],
              ),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24.0, 120.0, 24.0, 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's personalize your experience.",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white, height: 1.2),
                ).animate().fade(duration: 600.ms).slideX(begin: -0.2, end: 0),
                
                const SizedBox(height: 12),
                
                Text(
                  "Get ready for AFCON 2025 in just a few taps.",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade300),
                ).animate().fade(delay: 200.ms, duration: 600.ms).slideX(begin: -0.2, end: 0),
                
                const SizedBox(height: 50),

                TextField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: "Enter your name ",
                    hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.normal),
                    filled: true,
                    fillColor: Colors.grey.shade900.withOpacity(0.8),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.person, color: kMarocRed),
                  ),
                )
                .animate().fade(delay: 400.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
                
                const SizedBox(height: 24),

                _buildSelectorTile(
                  title: _selectedCity?.name ?? "Select Host City",
                  icon: Icons.location_city,
                  isSelected: _selectedCity != null,
                  onTap: () => _showCitySelectionSheet(context),
                )
                .animate().fade(delay: 600.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
                
                const SizedBox(height: 24),

                _buildSelectorTile(
                  title: _selectedTeam?.name ?? "Select Your Team",
                  icon: Icons.flag,
                  isSelected: _selectedTeam != null,
                  onTap: () => _showTeamSelectionSheet(context),
                )
                .animate().fade(delay: 800.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),

                const SizedBox(height: 60),

                SizedBox(
                  width: double.infinity, height: 60,
                  child: ElevatedButton(
                    onPressed: _validateAndContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kMarocRed, foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 10, shadowColor: kMarocRed.withOpacity(0.4),
                    ),
                    child: const Text("READY FOR KICK-OFF", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                )
                .animate().fade(delay: 1000.ms, duration: 600.ms).scale(begin: const Offset(0.9, 0.9), delay: 1000.ms, curve: Curves.elasticOut),
                
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectorTile({required String title, required IconData icon, required VoidCallback onTap, required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? kMarocRed : Colors.transparent, width: 2.5),
          boxShadow: isSelected ? [BoxShadow(color: kMarocRed.withOpacity(0.3), blurRadius: 12)] : [],
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? kMarocRed : Colors.grey, size: 28),
            const SizedBox(width: 16),
            Expanded(child: Text(title, style: TextStyle(color: isSelected ? Colors.white : Colors.grey.shade400, fontSize: 18, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500))),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey.shade700, size: 18),
          ],
        ),
      ),
    );
  }

  void _validateAndContinue() {
    if (_nameController.text.isEmpty || _selectedCity == null || _selectedTeam == null) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Please fill all fields to continue!"), backgroundColor: Colors.red.shade800));
    } else {
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => DashboardScreen(userName: _nameController.text, userCity: _selectedCity!, userTeam: _selectedTeam!)),
       );
    }
  }

  void _showCitySelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context, backgroundColor: kMarocDark,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: 5, width: 50, decoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.circular(10)), margin: const EdgeInsets.only(bottom: 20)),
              const Text("Select Host City", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: mockCities.length,
                  separatorBuilder: (c, i) => Divider(color: Colors.grey.shade800, height: 1),
                  itemBuilder: (context, index) {
                    final city = mockCities[index];
                    final isCurrentlySelected = _selectedCity?.id == city.id;
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      leading: CircleAvatar(backgroundImage: AssetImage(city.imagePath), radius: 25),
                      title: Text(city.name, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: isCurrentlySelected ? FontWeight.bold : FontWeight.normal)),
                      trailing: isCurrentlySelected ? const Icon(Icons.check_circle, color: kMarocRed, size: 30) : null,
                      onTap: () { setState(() => _selectedCity = city); Navigator.pop(context); },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showTeamSelectionSheet(BuildContext context) {
    _searchController.clear();
    _searchText = "";

    showModalBottomSheet(
      context: context, backgroundColor: kMarocDark, isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setSheetState) {
            final filteredTeams = mockTeams.where((team) {
              return team.name.toLowerCase().contains(_searchText.toLowerCase());
            }).toList();

            return DraggableScrollableSheet(
              initialChildSize: 0.8, minChildSize: 0.5, maxChildSize: 0.95, expand: false,
              builder: (_, controller) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(height: 5, width: 50, decoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.circular(10)), margin: const EdgeInsets.only(bottom: 20)),
                      const Text("Select Your Team", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),

                      TextField(
                        controller: _searchController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search team...",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          prefixIcon: const Icon(Icons.search, color: kMarocRed),
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        ),
                        onChanged: (value) {
                          setSheetState(() {
                            _searchText = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      Expanded(
                        child: filteredTeams.isEmpty
                        ? const Center(child: Text("No team found.", style: TextStyle(color: Colors.grey)))
                        : ListView.separated(
                          controller: controller,
                          itemCount: filteredTeams.length,
                          separatorBuilder: (context, index) => Divider(color: Colors.grey.shade800, height: 1),
                          itemBuilder: (context, index) {
                            final team = filteredTeams[index];
                            final isCurrentlySelected = _selectedTeam?.id == team.id;
                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              leading: Container(
                                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade800, width: 2)),
                                child: ClipOval(child: Image.asset(team.flagPath, width: 50, height: 50, fit: BoxFit.cover)),
                              ),
                              title: Text(team.name, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: isCurrentlySelected ? FontWeight.bold : FontWeight.normal)),
                              subtitle: Text("Group ${team.group}", style: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                              trailing: isCurrentlySelected ? const Icon(Icons.check_circle, color: kMarocRed, size: 30) : null,
                              onTap: () {
                                 setState(() => _selectedTeam = team);
                                 Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            );
          }
        );
      },
    );
  }
}
