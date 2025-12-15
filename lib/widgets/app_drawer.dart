// lib/widgets/app_drawer.dart

import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../models/city_model.dart';
import '../models/place_model.dart';
import '../models/team_model.dart';
import '../screens/city_guide/places_list_screen.dart';
import '../screens/city_guide/stadium_detail_screen.dart';
import '../screens/city_guide/sos_screen.dart';
import '../main.dart';
import '../screens/team_detail_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/ticket_screen.dart';
import '../screens/matches_screen.dart';

class AppDrawer extends StatefulWidget {
  final String userName;
  final Team userTeam;
  final City userCity;

  const AppDrawer({
    super.key,
    required this.userName,
    required this.userTeam,
    required this.userCity,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _isCityMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kMarocDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/bg_dashboard.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(kMarocDark.withOpacity(0.8), BlendMode.darken)
              ),
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
              color: kMarocDark,
               boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 15, offset: const Offset(0, 8))]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                   padding: const EdgeInsets.all(4),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(color: kMarocRed, width: 3),
                     boxShadow: [
                       BoxShadow(
                         color: kMarocRed.withOpacity(0.6),
                         blurRadius: 20,
                         spreadRadius: 2
                       )
                     ]
                   ),
                   child: ClipOval(
                     child: Image.asset(
                       widget.userTeam.flagPath,
                       width: 80,
                       height: 80,
                       fit: BoxFit.cover
                     )
                   )
                ),
                const SizedBox(height: 16),
                Text(
                  widget.userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.1))
                  ),
                  child: Text(
                    "Fan of ${widget.userTeam.name} • In ${widget.userCity.name}",
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13, fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(context, Icons.home, "Home", () {
                  Navigator.pop(context);
                }),
                _buildDivider(),
                ListTile(
                  leading: Container(
                     padding: const EdgeInsets.all(1),
                     decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kMarocRed, width: 1)),
                     child: ClipOval(child: Image.asset(widget.userTeam.flagPath, width: 24, height: 24, fit: BoxFit.cover))
                  ),
                  title: Text("Your Team: ${widget.userTeam.name}", style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => TeamDetailScreen(team: widget.userTeam)),
                    );
                  },
                ),
                _buildMenuItem(context, Icons.confirmation_number, "My Ticket", () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketScreen(
                          userName: widget.userName,
                          userTeam: widget.userTeam,
                        ),
                      ),
                    );
                }),
                ListTile(
                  leading: Icon(Icons.location_city, color: kMarocRed),
                  title: Text("Your City: ${widget.userCity.name}", style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  trailing: Icon(_isCityMenuOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.white70),
                  onTap: () {
                    setState(() {
                      _isCityMenuOpen = !_isCityMenuOpen;
                    });
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                ),
                if (_isCityMenuOpen) ...[
                  _buildSubMenuItem(context, "Stadium Guide", Icons.stadium, Colors.blueAccent),
                  _buildSubMenuItem(context, "Hotels & Riads", Icons.hotel, Colors.orangeAccent),
                  _buildSubMenuItem(context, "Best Food", Icons.restaurant_menu, Colors.greenAccent),
                  _buildSubMenuItem(context, "Must-See Places", Icons.camera_alt, Colors.purpleAccent),
                  _buildSubMenuItem(context, "Transport", Icons.directions_bus, Colors.teal),
                  _buildSubMenuItem(context, "SOS & Help", Icons.local_hospital, kMarocRed),
                  _buildDivider(),
                ],
                _buildMenuItem(context, Icons.live_tv, "World Cup 2026 ", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MatchesScreen()),
                  );
                }),
                _buildDivider(),
                _buildMenuItem(context, Icons.settings, "Settings", () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(
                        userName: widget.userName,
                        userCity: widget.userCity,
                        userTeam: widget.userTeam,
                      ),
                    ),
                  );
                }),
                _buildDivider(),
                _buildMenuItem(context, Icons.logout, "Sign Out", () {
                   Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SplashScreen()),
                    (route) => false,
                  );
                }, isDestructive: true),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text("Version 1.1.0 ", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    Color color = isDestructive ? kMarocRed : Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
    );
  }

  Widget _buildSubMenuItem(BuildContext context, String title, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color, size: 20),
      title: Text(title, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
      contentPadding: const EdgeInsets.only(left: 50, right: 24),
      dense: true,
      onTap: () {
        Navigator.pop(context);

        Widget? nextScreen;
        String listTitle = "";
        List<Place> placesToList = [];

        if (title.contains("Stadium")) {
           nextScreen = StadiumDetailScreen(city: widget.userCity);
        }
        else if (title.contains("Hotels")) {
          listTitle = "${widget.userCity.name} Hotels";
          placesToList = widget.userCity.hotels;
          nextScreen = PlacesListScreen(title: listTitle, places: placesToList);
        }
        else if (title.contains("Food")) {
          listTitle = "Best Food in ${widget.userCity.name}";
          placesToList = widget.userCity.restaurants;
          nextScreen = PlacesListScreen(title: listTitle, places: placesToList);
        }
          else if (title.contains("Must-See")) {
          listTitle = "Must-See in ${widget.userCity.name}";
          placesToList = widget.userCity.attractions;
          nextScreen = PlacesListScreen(title: listTitle, places: placesToList);
        }
        else if (title.contains("Transport")) {
          listTitle = "Transport in ${widget.userCity.name}";
          placesToList = widget.userCity.transports;
          nextScreen = PlacesListScreen(title: listTitle, places: placesToList);
        }
        else if (title.contains("SOS")) {
           nextScreen = SosScreen(city: widget.userCity);
        }

        if (nextScreen != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen!));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$title coming soon!")));
        }
      },
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey.shade800, thickness: 1, indent: 24, endIndent: 24);
  }
}
