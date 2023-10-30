import 'dart:convert';

Player playerFromJson(String str) => Player.fromJson(json.decode(str));
String playerToJson(Player data) => json.encode(data.toJson());

class Player {
  String idPlayer;
  String strPlayer;
  // String strNationality;
  // String strTeam;
  String? strDescriptionEN;
  String? strThumb;

  Player({
    required this.idPlayer,
    required this.strPlayer,
    // required this.strNationality,
    // required this.strTeam,
    required this.strDescriptionEN,
    required this.strThumb,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        idPlayer: json["idPlayer"],
        strPlayer: json["strPlayer"],
        // strNationality: json["strNationality"],
        // strTeam: json["strTeam"],
        strDescriptionEN: json["strDescriptionEN"],
        strThumb: json["strThumb"],
      );

  Map<String, dynamic> toJson() => {
        "idPlayer": idPlayer,
        "strPlayer": strPlayer,
        // "strNationality": strNationality,
        // "strTeam": strTeam,
        "strDescriptionEN": strDescriptionEN,
        "strThumb": strThumb,
      };
}
