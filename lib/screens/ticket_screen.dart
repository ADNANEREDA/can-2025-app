// lib/screens/ticket_screen.dart

import 'package:flutter/material.dart';
import 'dart:math';
import '../core/constants.dart';
import '../models/team_model.dart';
import '../data/mock_matches.dart';

class TicketScreen extends StatelessWidget {
  final String userName;
  final Team userTeam;

  const TicketScreen({
    super.key,
    required this.userName,
    required this.userTeam,
  });

  @override
  Widget build(BuildContext context) {
    final myMatch = matches.firstWhere(
      (m) => m.team1.name == userTeam.name || m.team2.name == userTeam.name,
      orElse: () => matches[0],
    );

    final random = Random();
    final gateNum = random.nextInt(20) + 1;
    final gateLetter = ['A', 'B', 'C', 'D'][random.nextInt(4)];
    final randomGate = "$gateNum$gateLetter";
    final randomRow = (random.nextInt(50) + 1).toString();
    final randomSeat = (random.nextInt(200) + 1).toString();

    return Scaffold(
      backgroundColor: kMarocDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("My Digital Ticket", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: kMarocRed,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "AFCON 2025 • GROUP ${myMatch.group}",
                            style: TextStyle(color: Colors.white.withOpacity(0.9), letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            myMatch.stadium,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Text(myMatch.date, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(myMatch.time, style: const TextStyle(color: kMarocRed, fontWeight: FontWeight.w900, fontSize: 28)),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: _buildTeamColumn(myMatch.team1.name, myMatch.team1.flag)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("VS", style: TextStyle(color: kBlack, fontSize: 24, fontWeight: FontWeight.w900)),
                              ),
                              Expanded(child: _buildTeamColumn(myMatch.team2.name, myMatch.team2.flag)),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(children: List.generate(30, (index) => Expanded(child: Container(color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade300, height: 2)))),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildSeatInfo("GATE", randomGate),
                              _buildSeatInfo("ROW", randomRow),
                              _buildSeatInfo("SEAT", randomSeat),
                              _buildSeatInfo("PRICE", "150 MAD"),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.verified, color: kMarocGreen, size: 20),
                                const SizedBox(width: 8),
                                Text(userName.toUpperCase(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                            child: const Center(child: Icon(Icons.qr_code_2, size: 80, color: Colors.black)),
                          ),
                          const SizedBox(height: 12),
                          Text("Scan at entry gate", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ticket saved to Wallet! 📲"), backgroundColor: kMarocGreen));
                },
                icon: const Icon(Icons.download_rounded),
                label: const Text("ADD TO WALLET", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamColumn(String name, String flagPath) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade200, width: 1),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5, offset: const Offset(0, 2))]
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipOval(
                child: Image.asset(
                  flagPath,
                  width: 60, height: 60, fit: BoxFit.cover,
                  errorBuilder: (c,e,s) => const Icon(Icons.flag, color: Colors.grey),
                )
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis
        ),
      ],
    );
  }

  Widget _buildSeatInfo(String label, String value) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w900)),
      ],
    );
  }
}
