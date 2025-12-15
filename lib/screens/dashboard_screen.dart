// lib/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../models/city_model.dart';
import '../models/place_model.dart';
import '../models/team_model.dart';
import '../widgets/next_match_card.dart';
import 'city_guide/places_list_screen.dart';
import 'city_guide/stadium_detail_screen.dart';
import 'city_guide/sos_screen.dart';
import '../screens/team_detail_screen.dart';
import '../widgets/app_drawer.dart';

class DashboardScreen extends StatefulWidget {
  final String userName;
  final City userCity;
  final Team userTeam;

  const DashboardScreen({
    super.key,
    required this.userName,
    required this.userCity,
    required this.userTeam,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _showGuide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: AppDrawer(
        userName: widget.userName,
        userTeam: widget.userTeam,
        userCity: widget.userCity,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, ${widget.userName}!", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            const Text("Matchday Guide", style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeamDetailScreen(team: widget.userTeam)),
                );
              },
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kMarocRed, width: 2)),
                padding: const EdgeInsets.all(2),
                child: ClipOval(child: Image.asset(widget.userTeam.flagPath, width: 38, height: 38, fit: BoxFit.cover)),
              ),
            ),
          ),
        ],
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
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kMarocDark.withOpacity(0.7), kMarocDark.withOpacity(0.9), kMarocDark],
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, kToolbarHeight + 20, 24.0, 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NextMatchCard(userTeam: widget.userTeam, userCity: widget.userCity),

                    const SizedBox(height: 40),

                    if (!_showGuide)
                      Column(
                        children: [
                           Text("Discover ${widget.userCity.name}", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16)),
                           const SizedBox(height: 20),
                           SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  _showGuide = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kMarocRed,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 10,
                                shadowColor: kMarocRed.withOpacity(0.5),
                              ),
                              icon: const Icon(Icons.explore),
                              label: Text("EXPLORE ${widget.userCity.name.toUpperCase()}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1)),
                            ),
                          ),
                        ],
                      ),

                    if (_showGuide) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Explore ${widget.userCity.name}",
                            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.1),
                          ),
                          IconButton(
                            onPressed: () => setState(() => _showGuide = false), 
                            icon: const Icon(Icons.keyboard_arrow_up_rounded, color: Colors.grey)
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.2,
                        children: [
                          _buildDynamicCard(context, "Stadium Guide", Icons.stadium, Colors.blueAccent),
                          _buildDynamicCard(context, "Hotels & Riads", Icons.hotel, Colors.orangeAccent),
                          _buildDynamicCard(context, "Transport", Icons.directions_bus, Colors.teal),
                          _buildDynamicCard(context, "Best Food", Icons.restaurant_menu, Colors.greenAccent),
                          _buildDynamicCard(context, "Must-See Places", Icons.camera_alt, Colors.purpleAccent),
                          _buildDynamicCard(context, "SOS & Help", Icons.local_hospital, kMarocRed),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDynamicCard(BuildContext context, String title, IconData icon, Color accentColor) {
    Widget? nextScreen;
    String listTitle = "";
    List<Place> placesToList = [];

    if (title.contains("Stadium")) {
      nextScreen = StadiumDetailScreen(city: widget.userCity);
    } else if (title.contains("Hotels")) {
      listTitle = "${widget.userCity.name} Hotels";
      placesToList = widget.userCity.hotels;
      nextScreen = PlacesListScreen(title: listTitle, places: placesToList);
    } else if (title.contains("Food")) {
      listTitle = "Best Food in ${widget.userCity.name}";
      placesToList = widget.userCity.restaurants;
      nextScreen = PlacesListScreen(title: listTitle, places: placesToList);
    } else if (title.contains("Must-See")) {
      listTitle = "Must-See in ${widget.userCity.name}";
      placesToList = widget.userCity.attractions;
      nextScreen = PlacesListScreen(title: listTitle, places: placesToList);
    } else if (title.contains("Transport")) {
      listTitle = "Transport in ${widget.userCity.name}";
      placesToList = widget.userCity.transports;
      nextScreen = PlacesListScreen(title: listTitle, places: placesToList);
    } else if (title.contains("SOS")) {
      nextScreen = SosScreen(city: widget.userCity);
    }

    return GestureDetector(
      onTap: () {
        if (nextScreen != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen!));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$title coming soon!")));
        }
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Colors.grey.shade800, Colors.grey.shade900],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
          border: Border(left: BorderSide(color: accentColor, width: 5)),
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(
                icon,
                size: 90,
                color: accentColor.withOpacity(0.15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      letterSpacing: 1.0,
                      shadows: [Shadow(color: Colors.black, blurRadius: 5)] 
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_forward_rounded, color: accentColor, size: 18),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
