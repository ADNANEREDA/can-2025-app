// lib/screens/team_detail_screen.dart

import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../models/team_model.dart';
import '../data/mock_matches.dart' as match_data;

class TeamDetailScreen extends StatelessWidget {
  final Team team;

  const TeamDetailScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    final myMatches = match_data.matches.where((m) =>
      m.team1.name == team.name || m.team2.name == team.name
    ).toList();

    return Scaffold(
      backgroundColor: kMarocDark,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
           IconButton(
            icon: const Icon(Icons.favorite, color: kMarocRed),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kMarocDark,
                image: DecorationImage(
                  image: AssetImage(team.flagPath),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(kMarocDark.withOpacity(0.8), BlendMode.darken),
                ),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                 boxShadow: [BoxShadow(color: kMarocRed.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kMarocRed, width: 3), color: kMarocDark),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(team.flagPath),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    team.name.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 2),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: Text("GROUP ${team.group}", style: const TextStyle(color: kMarocRed, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  _buildStatCard("AFCON Titles", team.titles.toString(), Icons.emoji_events),
                  const SizedBox(width: 16),
                  _buildStatCard("Star Player", team.starPlayer.split(' ').last, Icons.star),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Group Stage Matches", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  if (myMatches.isEmpty)
                    const Text("No matches scheduled yet.", style: TextStyle(color: Colors.grey))
                  else
                    ...myMatches.map((match) => _buildMatchTile(match)).toList(),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          children: [
            Icon(icon, color: kMarocRed, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchTile(dynamic match) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(match.date.split(',')[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(match.time, style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
            ],
          ),
          Row(
            children: [
              Text(match.team1.name, style: TextStyle(color: match.team1.name == team.name ? kMarocRed : Colors.white, fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("vs", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              Text(match.team2.name, style: TextStyle(color: match.team2.name == team.name ? kMarocRed : Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
