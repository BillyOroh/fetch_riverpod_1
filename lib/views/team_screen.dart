import 'package:flutter/material.dart';
import 'package:fetch_riverpod_1/models/model_2.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({
    super.key,
    required this.team,
  });
  final Team team;

  @override
  Widget build(BuildContext context) {
    // int index = team[index];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 155, 135, 135),
        title: const Text('Team'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () => print(team.strTeamBadge),
                  child: CircleAvatar(
                    maxRadius: 100,
                    backgroundImage: NetworkImage(team.strTeamBadge),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(team.strTeam),
            ],
          ),
        ),
      ),
    );
  }
}
