// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:fetch_riverpod_1/model/model.dart';
// import 'package:fetch_riverpod_1/models/model_3.dart';
// import 'package:fetch_riverpod_1/services/services.dart';

// class PlayerScreen extends ConsumerWidget {
//   final String player;
//   const PlayerScreen({super.key, required this.player});

//   @override
//   Widget build(
//     BuildContext context,
//     WidgetRef ref,
//   ) {
//     final playerData = ref.watch(playerDataProvider(player));
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(0, 155, 135, 135),
//         title: const Text('Players'),
//       ),
//       body: playerData.when(
//           data: (playerData) {
//             List<Player> leagueList = playerData.map((e) => e).toList();

//             return ListView.builder(
//               itemCount: leagueList.length,
//               itemBuilder: (_, index) {
//                 // playerDesc() {
//                 //   if (leagueList[index].strDescriptionEN == null) {
//                 //     return const Text('no description');
//                 //   } else if (leagueList[index].strDescriptionEN != null){
//                 //     String description = leagueList[index].strDescriptionEN;
//                 //     Text(description);
//                 //   }
//                 // }

//                 return Card(
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                   child: ListTile(
//                     // onTap: () {
//                     //   Navigator.push(
//                     //       context,
//                     //       MaterialPageRoute(
//                     //         builder: (context) => LeagueScreen(
//                     //             team: leagueList[index].strLeague),
//                     //       ));
//                     // },
//                     title: Text(leagueList[index].strPlayer),
//                     subtitle: Text(
//                         leagueList[index].strDescriptionEN ?? 'No information on this player'),
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       backgroundImage: NetworkImage(leagueList[index]
//                               .strThumb ??
//                           "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//           error: (err, s) {
//             return const Center(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Image(
//                   image: AssetImage('error.png'),
//                 ),
//                 Text(
//                   'No player found!',
//                   style: TextStyle(fontSize: 30.0),
//                 ),
//               ],
//             ));
//           },
//           loading: () => const Center(
//                 child: CircularProgressIndicator(),
//               )),
//     );
//   }
// }
