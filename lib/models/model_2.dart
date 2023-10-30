class Team {
  String idTeam;
  String strTeam;
  String strSport;
  String strLeague;
  String strDescriptionEN;
  String strTeamBadge;

  Team({
    required this.idTeam,
    required this.strTeam,
    required this.strSport,
    required this.strLeague,
    required this.strDescriptionEN,
    required this.strTeamBadge,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
      idTeam: json["idTeam"],
      strTeam: json["strTeam"],
      strSport: json["strSport"],
      strLeague: json["strLeague"],
      strDescriptionEN: json["strDescriptionEN"],
      strTeamBadge: json["strTeamBadge"]);

  Map<String, dynamic> toJson() => {
        "idTeam": idTeam,
        "strTeam": strTeam,
        "strSport": strSport,
        "strLeague": strLeague,
        "strDescriptionEN": strDescriptionEN,
        "strTeamBadge": strTeamBadge,
      };
}
