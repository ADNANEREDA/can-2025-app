// lib/models/team_model.dart

class Team {
  final String id;
  final String name;
  final String flagPath;
  final String group;
  final int titles;
  final String starPlayer;

  Team({
    required this.id,
    required this.name,
    required this.flagPath,
    required this.group,
    this.titles = 0,
    required this.starPlayer,
  });
}
