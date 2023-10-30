import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fetch_riverpod_1/model/model.dart';
import 'package:fetch_riverpod_1/models/model_2.dart';
import 'package:fetch_riverpod_1/services/services.dart';

class LeagueScreen extends ConsumerWidget {
  final String team;
  const LeagueScreen({super.key, required this.team});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final _data = ref.watch(teamDetailsDataProvider(team));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 155, 135, 135),
        title: const Text('League'),
      ),
      body: _data.when(
          data: (_data) {
            List<Team> leagueList = _data.map((e) => e).toList();
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: leagueList.length,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          title: Text(leagueList[index].strTeam),
                          subtitle: Text(leagueList[index].strDescriptionEN),
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                NetworkImage(leagueList[index].strTeamBadge),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
          error: (err, s) {
            return const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage('error.png'),
                ),
                Text(
                  'No information on this league!',
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ));
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
