// lib/core/services/matches_api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/match_model.dart';

class MatchesApiService {
  static const String _apiKey = "e0ff645e9dd94980b4167354a31bbc91";
  // ✅ On utilise l'endpoint de base SANS filtre de compétition
  static const String _baseUrl = "https://api.football-data.org/v4/competitions/2000/matches";

  
  Future<List<MatchModel>> fetchCanMatches() async { // On garde le nom de la fonction pour l'instant
    print("📡 Connexion à Football-Data.org pour tous les matchs récents...");

    // On crée l'URI SANS les paramètres de filtre (pas de ?competitions=...)
    final uri = Uri.parse(_baseUrl);

    final response = await http.get(
      uri, 
      headers: {
        "X-Auth-Token": _apiKey,
      },
    );

    if (response.statusCode == 200) {
      print("✅ Données reçues !");
      final jsonBody = jsonDecode(response.body);

      final List matchesJson = jsonBody["matches"] ?? [];
      
      return matchesJson.map((e) => MatchModel.fromJson(e)).toList();
    } else {
      throw Exception("Erreur API : ${response.statusCode}");
    }
  }
}