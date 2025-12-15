// lib/data/mock_matches.dart

// On définit une petite classe juste pour ce fichier pour simplifier
class MockMatchTeam {
  final String name;
  final String flag;
  MockMatchTeam(this.name, this.flag);
}

class MockMatch {
  final String id;
  final String group;
  final String round;
  final String date;
  final String time;
  final String stadium;
  final MockMatchTeam team1;
  final MockMatchTeam team2;

  MockMatch({
    required this.id, 
    required this.group, 
    required this.round, 
    required this.date, 
    required this.time, 
    required this.stadium, 
    required this.team1, 
    required this.team2
  });
}


// LA LISTE DES MATCHS (Données) - 1ère Journée complète
final List<MockMatch> matches = [
  // --- GROUP A ---
  MockMatch(
    id: "A1",
    group: "A",
    round: "MATCHDAY 1",
    date: "Sunday, Dec 21",
    time: "20:00",
    stadium: "Prince Moulay Abdellah - Rabat",
    team1: MockMatchTeam("Morocco", "assets/flags/maroc.png"),
    team2: MockMatchTeam("Comoros", "assets/flags/km.png"),
  ),
  MockMatch(
    id: "A2",
    group: "A",
    round: "MATCHDAY 1",
    date: "Monday, Dec 22",
    time: "15:00",
    stadium: "Mohammed V - Casablanca",
    team1: MockMatchTeam("Mali", "assets/flags/ml.png"),
    team2: MockMatchTeam("Zambia", "assets/flags/zm.png"),
  ),

  // --- GROUP B ---
  MockMatch(
    id: "B1",
    group: "B",
    round: "MATCHDAY 1",
    date: "Monday, Dec 22",
    time: "18:00",
    stadium: "Adrar Stadium - Agadir",
    team1: MockMatchTeam("Egypt", "assets/flags/eg.png"),
    team2: MockMatchTeam("Zimbabwe", "assets/flags/zw.png"),
  ),
  MockMatch(
    id: "B2",
    group: "B",
    round: "MATCHDAY 1",
    date: "Monday, Dec 22",
    time: "21:00",
    stadium: "Adrar Stadium - Agadir",
    team1: MockMatchTeam("South Africa", "assets/flags/za.png"),
    team2: MockMatchTeam("Angola", "assets/flags/ao.png"),
  ),

  // --- GROUP C ---
  MockMatch(
    id: "C1",
    group: "C",
    round: "MATCHDAY 1",
    date: "Tuesday, Dec 23",
    time: "18:00",
    stadium: "Marrakesh Stadium",
    team1: MockMatchTeam("Nigeria", "assets/flags/ng.png"),
    team2: MockMatchTeam("Uganda", "assets/flags/ug.png"),
  ),
  MockMatch(
    id: "C2",
    group: "C",
    round: "MATCHDAY 1",
    date: "Tuesday, Dec 23",
    time: "21:00",
    stadium: "Marrakesh Stadium",
    team1: MockMatchTeam("Tunisia", "assets/flags/tn.png"),
    team2: MockMatchTeam("Tanzania", "assets/flags/tz.png"),
  ),
  // --- GROUP D ---
  MockMatch(
    id: "D1",
    group: "D",
    round: "MATCHDAY 1",
    date: "Wednesday, Dec 24",
    time: "15:00",
    stadium: "Ibn Batouta - Tangier",
    team1: MockMatchTeam("Senegal", "assets/flags/sn.png"),
    team2: MockMatchTeam("Benin", "assets/flags/bj.png"),
  ),
  MockMatch(
    id: "D2",
    group: "D",
    round: "MATCHDAY 1",
    date: "Wednesday, Dec 24",
    time: "18:00",
    stadium: "Ibn Batouta - Tangier",
    team1: MockMatchTeam("DR Congo", "assets/flags/cd.png"),
    team2: MockMatchTeam("Botswana", "assets/flags/bw.png"),
  ),

  // --- GROUP E ---
  MockMatch(
    id: "E1",
    group: "E",
    round: "MATCHDAY 1",
    date: "Thursday, Dec 25",
    time: "15:00",
    stadium: "Fez Stadium",
    team1: MockMatchTeam("Algeria", "assets/flags/dz.png"),
    team2: MockMatchTeam("Sudan", "assets/flags/sd.png"),
  ),
  MockMatch(
    id: "E2",
    group: "E",
    round: "MATCHDAY 1",
    date: "Thursday, Dec 25",
    time: "18:00",
    stadium: "Fez Stadium",
    team1: MockMatchTeam("Burkina Faso", "assets/flags/bf.png"),
    team2: MockMatchTeam("Equatorial Guinea", "assets/flags/gq.png"),
  ),

  // --- GROUP F ---
  MockMatch(
    id: "F1",
    group: "F",
    round: "MATCHDAY 1",
    date: "Friday, Dec 26",
    time: "17:00",
    stadium: "Marrakesh Stadium",
    team1: MockMatchTeam("Ivory Coast", "assets/flags/ci.png"),
    team2: MockMatchTeam("Gabon", "assets/flags/ga.png"),
  ),
  MockMatch(
    id: "F2",
    group: "F",
    round: "MATCHDAY 1",
    date: "Friday, Dec 26",
    time: "20:00",
    stadium: "Fez Stadium",
    team1: MockMatchTeam("Cameroon", "assets/flags/cm.png"),
    team2: MockMatchTeam("Mozambique", "assets/flags/mz.png"),
  ),
];
