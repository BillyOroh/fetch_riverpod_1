// To parse this JSON data, do
//
//     final league = leagueFromJson(jsonString);

// import 'dart:convert';

// League leagueFromJson(String str) => League.fromJson(json.decode(str));

// String leagueToJson(League data) => json.encode(data.toJson());

// class League {
//   List<AllLeague> leagues;

//   League({
//     required this.leagues,
//   });

//   factory League.fromJson(Map<String, dynamic> json) => League(
//         leagues: List<AllLeague>.from(
//             json["leagues"].map((x) => AllLeague.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "leagues": List<dynamic>.from(leagues.map((x) => x.toJson())),
//       };
// }

// enum SportCatagory { soccer, basketball, cricket, other }

class AllLeague {
  String idLeague;
  String strLeague;
  String strSport;
  String? strLeagueAlternate;

  AllLeague({
    required this.idLeague,
    required this.strLeague,
    required this.strSport,
    required this.strLeagueAlternate,
  });

  factory AllLeague.fromJson(Map<String, dynamic> json) => AllLeague(
        idLeague: json["idLeague"],
        strLeague: json["strLeague"],
        strSport: json["strSport"],
        strLeagueAlternate: json["strLeagueAlternate"],
      );

  Map<String, dynamic> toJson() => {
        "idLeague": idLeague,
        "strLeague": strLeague,
        "strSport": strSport,
        "strLeagueAlternate": strLeagueAlternate,
      };
}
