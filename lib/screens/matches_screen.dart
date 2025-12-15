import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/services/matches_api_service.dart';
import '../models/match_model.dart';
import '../core/constants.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  final MatchesApiService _apiService = MatchesApiService();
  late Future<List<MatchModel>> _matchesFuture;

  @override
  void initState() {
    super.initState();
    _matchesFuture = _apiService.fetchCanMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMarocDark,
      appBar: AppBar(
        title: const Text("World Cup 2026"),
        backgroundColor: kMarocRed,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<MatchModel>>(
        future: _matchesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: kMarocRed));
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Oops! Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (snapshot.hasData) {
            final List<MatchModel> matches = snapshot.data!;

            if (matches.isEmpty) {
              return const Center(child: Text("No matches found.", style: TextStyle(color: Colors.white)));
            }

            return ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                final match = matches[index];
                return _buildMatchCard(context, match);
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildMatchCard(BuildContext context, MatchModel match) {
    final bool isFinished = match.homeScore != null && match.awayScore != null;

    final DateTime matchDateTime = DateTime.parse(match.matchTime).toLocal();
    final String formattedTime = DateFormat('HH:mm').format(matchDateTime);
    final String formattedDate = DateFormat('dd MMM').format(matchDateTime);

    final Color statusColor = isFinished ? Colors.greenAccent : Colors.amber;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Card(
        color: Colors.grey[850],
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: statusColor.withOpacity(0.3), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                isFinished ? "FINAL ($formattedDate)" : "SCHEDULED $formattedDate at $formattedTime",
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: _buildTeamWidget(
                      name: match.homeTeamName,
                      logoUrl: match.homeLogo,
                      isHome: true,
                      isWinner: isFinished && (match.homeScore ?? 0) > (match.awayScore ?? 0),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          isFinished ? "${match.homeScore} - ${match.awayScore}" : "VS",
                          style: TextStyle(
                            color: isFinished ? Colors.white : Colors.grey.shade400,
                            fontSize: isFinished ? 28 : 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        if (!isFinished) Text("Live Time", style: TextStyle(color: statusColor, fontSize: 10)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: _buildTeamWidget(
                      name: match.awayTeamName,
                      logoUrl: match.awayLogo,
                      isHome: false,
                      isWinner: isFinished && (match.awayScore ?? 0) > (match.homeScore ?? 0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamWidget({
    required String name,
    required String logoUrl,
    required bool isHome,
    required bool isWinner,
  }) {
    final Widget textWidget = Text(
      name,
      textAlign: isHome ? TextAlign.left : TextAlign.right,
      style: TextStyle(
        color: name == 'Inconnu' ? Colors.grey : (isWinner ? kMarocRed : Colors.white),
        fontWeight: isWinner ? FontWeight.w900 : FontWeight.w600,
        fontSize: 15,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );

    return Row(
      mainAxisAlignment: isHome ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (isHome) Flexible(child: textWidget),
        if (!isHome) Flexible(child: textWidget),
      ],
    );
  }
}
