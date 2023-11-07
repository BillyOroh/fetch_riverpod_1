import 'dart:math';

import 'package:fetch_riverpod_1/leagues_page/leagues_screen.dart';
import 'package:fetch_riverpod_1/global_views/detail_screen.dart';
// import 'package:fetch_riverpod_1/views/players_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fetch_riverpod_1/home_page/home_model.dart';
import 'package:fetch_riverpod_1/players_page/players_model.dart';
import 'package:fetch_riverpod_1/services/services.dart';
import 'package:fetch_riverpod_1/constants/colors.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final TextEditingController searchController = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // searchController.text = 'coba';
  // }

  @override
  Widget build(
    BuildContext context,
  ) {
    final allTeamData = ref.watch(allLeagueDataProvider);
    String player = searchController.text;
    AsyncValue<List<Player>> playerData = ref.watch(playerDataProvider(player));

    getRandomColor() {
      Random random = Random();
      return backgroundColors[random.nextInt(backgroundColors.length)];
    }

    allTeam() {
      return allTeamData.when(
          data: (data) {
            List<AllLeague> leagueList = data.map((e) => e).toList();
            return Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (_, index) {
                  // Color? sportColor() {
                  //   if (leagueList[index].strSport == 'Soccer') {
                  //     return Colors.amber;
                  //   } else {
                  //     return Colors.blue;
                  //   }
                  //   // Color? color;
                  //   // switch (leagueList[index].strSport) {
                  //   //   case SportCatagory.soccer:
                  //   //     color = Colors.amber;
                  //   //     break;
                  //   //   case SportCatagory.basketball:
                  //   //     color = Colors.green;
                  //   //     break;
                  //   //   case SportCatagory.cricket:
                  //   //     color = Colors.red;
                  //   //     break;
                  //   // }
                  //   // return color;
                  // }

                  sportImage() {
                    if (leagueList[index].strSport == "Soccer") {
                      return const AssetImage('soccer.png');
                    } else {
                      return const AssetImage('allsport.png');
                    }
                  }

                  return Card(
                    color: getRandomColor(),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LeagueScreen(
                                  team: leagueList[index].strLeague),
                            ));
                      },
                      title: Text(leagueList[index].strLeague),
                      subtitle: Text(leagueList[index].strSport),
                      leading: CircleAvatar(
                        foregroundImage: sportImage(),
                        // backgroundColor: sportColor(),
                      ),
                      // trailing: IconButton(
                      //   onPressed: () => print(leagueList.length.toString()),
                      //   icon: Icon(Icons.add),
                      // ),
                    ),
                  );
                },
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ));
    }

    allPlayer() {
      return playerData.when(
          data: (data) {
            List<Player> leagueList = data.map((e) => e).toList();
            return Expanded(
              child: ListView.builder(
                itemCount: leagueList.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(player: leagueList[index]),
                            ));
                      },
                      title: Text(leagueList[index].strPlayer),
                      subtitle: Text(leagueList[index].strDescriptionEN ??
                          'No information on this player'),
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(leagueList[index]
                                .strThumb ??
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                      ),
                    ),
                  );
                },
              ),
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
                  'No player found!',
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ));
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ));
    }

    showOnScreen() {
      if (searchController.text.isEmpty) {
        return allTeam();
      } else {
        return allPlayer();
      }
    }

    return Scaffold(
        appBar: AppBar(
          // flexibleSpace: Container(
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //     image: AssetImage('banner.png'),
          //   )),
          // ),
          backgroundColor: const Color.fromARGB(0, 155, 135, 135),
          title: const Text('All League'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12.0),
                          hintText: 'Search player...',
                          prefixIcon: const Icon(Icons.search),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                        onChanged: (value) {
                          playerData = ref.watch(playerDataProvider(value));
                          // ref.watch(playerDataProvider(value));
                          // showOnScreen(playerData);
                          // print(playerData.hasValue);
                          // print(playerData.value);
                          print(value);
                        },
                        // onSubmitted: (player) {
                        //   searchController.text = player;
                        //   print(player);
                        // },
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     // Navigator.push(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //       builder: (context) =>
                    //     //           PlayerScreen(player: searchController.text),
                    //     //     ));
                    //     showOnScreen(ref.watch(playerDataProvider(player)));

                    //   },
                    //   icon: const Icon(Icons.search),
                    // )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              showOnScreen(),
            ],
          ),
        ));
  }
}
