import 'package:flutter/material.dart';
import 'package:fetch_riverpod_1/league_page/league_model.dart';
import 'package:fetch_riverpod_1/players_page/players_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    this.team,
    this.player,
  });
  final Team? team;
  final Player? player;

  @override
  Widget build(BuildContext context) {
    final isTeam = team != null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 155, 135, 135),
        title: Text(isTeam ? 'Team' : 'Player'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () => print(team!.strTeamBadge),
                  child: CircleAvatar(
                    maxRadius: 100,
                    backgroundImage: NetworkImage(isTeam
                        ? team!.strTeamBadge
                        : player?.strThumb ??
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(isTeam ? team!.strTeam : player!.strPlayer),
            ],
          ),
        ),
      ),
    );
  }
}
