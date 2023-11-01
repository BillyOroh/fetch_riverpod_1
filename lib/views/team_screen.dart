import 'package:flutter/material.dart';
import 'package:fetch_riverpod_1/models/model_2.dart';
import 'package:fetch_riverpod_1/models/model_3.dart';

class TeamScreen extends StatelessWidget {
   const TeamScreen({
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
        title:  Text(isTeam ? 'Team' : 'Player'),
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
                    backgroundImage: NetworkImage(isTeam ? team!.strTeamBadge : player?.strThumb ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
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
