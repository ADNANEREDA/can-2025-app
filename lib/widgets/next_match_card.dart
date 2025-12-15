import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../models/city_model.dart';
import '../models/team_model.dart';
import '../core/utils/time_helper.dart';
import '../data/mock_matches.dart';

class NextMatchCard extends StatefulWidget {
  final Team userTeam;
  final City userCity;

  const NextMatchCard({super.key, required this.userTeam, required this.userCity});

  @override
  State<NextMatchCard> createState() => _NextMatchCardState();
}

class _NextMatchCardState extends State<NextMatchCard> {
  late Timer _timer;
  final DateTime _matchDate = DateTime(2025, 12, 21, 20, 0, 0);
  Map<String, String>? _timeLeftDisplay;
  late MockMatch _myMatch;

  @override
  void initState() {
    super.initState();
    _myMatch = matches.firstWhere(
      (m) => m.team1.name == widget.userTeam.name || m.team2.name == widget.userTeam.name,
      orElse: () => matches[0],
    );
    _timeLeftDisplay = TimeHelper.getTimeLeft(_matchDate);
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _timeLeftDisplay = TimeHelper.getTimeLeft(_matchDate);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kMarocRed.withOpacity(0.7),
                kMarocRed.withOpacity(0.4),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white70, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    "UPCOMING - GROUP ${_myMatch.group}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: _buildTeamInfo(_myMatch.team1.name, _myMatch.team1.flag)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("VS", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
                  ),
                  Expanded(child: _buildTeamInfo(_myMatch.team2.name, _myMatch.team2.flag)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_timeLeftDisplay != null) ...[
                    _buildCountdownBox(_timeLeftDisplay!["unit1"]!, _timeLeftDisplay!["label1"]!),
                    const SizedBox(width: 10),
                    _buildCountdownBox(_timeLeftDisplay!["unit2"]!, _timeLeftDisplay!["label2"]!),
                    const SizedBox(width: 10),
                    _buildCountdownBox(_timeLeftDisplay!["unit3"]!, _timeLeftDisplay!["label3"]!),
                  ],
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _myMatch.stadium,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            _myMatch.date,
                            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountdownBox(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTeamInfo(String name, String flagPath) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 2),
          ),
          padding: const EdgeInsets.all(2),
          child: ClipOval(
            child: Image.asset(
              flagPath,
              width: 45,
              height: 45,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => Container(
                width: 45,
                height: 45,
                color: Colors.grey,
                child: const Icon(Icons.flag),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
