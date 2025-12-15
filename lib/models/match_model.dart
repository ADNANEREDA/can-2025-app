class MatchModel {
  final String id;
  final String homeTeamName;
  final String awayTeamName;
  final String homeLogo;
  final String awayLogo;
  final String matchTime;
  final int? homeScore;
  final int? awayScore;

  MatchModel({
    required this.id,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeLogo,
    required this.awayLogo,
    required this.matchTime,
    this.homeScore,
    this.awayScore,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    final homeId = json["homeTeam"]["id"];
    final awayId = json["awayTeam"]["id"];

    return MatchModel(
      id: json["id"].toString(),

      homeTeamName: json["homeTeam"]["name"] ?? "Unknown",
      awayTeamName: json["awayTeam"]["name"] ?? "Unknown",

    
      homeLogo: homeId != null
          ? "https://crests.football-data.org/$homeId.svg"
          : "https://upload.wikimedia.org/wikipedia/commons/8/89/HD_transparent_picture.png",

      awayLogo: awayId != null
          ? "https://crests.football-data.org/$awayId.svg"
          : "https://upload.wikimedia.org/wikipedia/commons/8/89/HD_transparent_picture.png",

      
      matchTime: json["utcDate"] ?? "1970-01-01T00:00:00Z",
      homeScore: json["score"]["fullTime"]["home"],
      awayScore: json["score"]["fullTime"]["away"],
    );
  }
}
