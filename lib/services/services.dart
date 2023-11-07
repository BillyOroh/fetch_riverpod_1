import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:fetch_riverpod_1/home_page/home_model.dart';
import 'package:fetch_riverpod_1/league_page/league_model.dart';
import 'package:fetch_riverpod_1/players_page/players_model.dart';

class ApiServices {
  // final WidgetRef ref;
  // ApiServices({required this.ref});
  // String endpoint = 'https://www.thesportsdb.com/api/v1/json/3/all_leagues.php';
  String baseUrl = 'https://www.thesportsdb.com/api/v1/json/3/';
  // String team = ref.watch(provider)
  Future<List<AllLeague>> getAllLeagues() async {
    String allLeagueUrl = '$baseUrl/all_leagues.php';
    Response response = await get(Uri.parse(allLeagueUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['leagues'];
      return result.map(((e) => AllLeague.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<Team>> getTeamDetails(String team) async {
    Uri teamUrl = Uri.parse(team);
    String teamDetailsUrl = '$baseUrl/search_all_teams.php?l=$teamUrl';

    Response response = await get(Uri.parse(teamDetailsUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['teams'];
      return result.map(((e) => Team.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<Player>> getPlayer(String player) async {
    Uri playerUrl = Uri.parse(player);
    String playerDetailUrl =
        'https://www.thesportsdb.com/api/v1/json/3/searchplayers.php?p=$playerUrl';

    Response response = await get(Uri.parse(playerDetailUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['player'];
      return result.map(((e) => Player.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

// class TeamNotifier extends StateNotifier<String> {
//   TeamNotifier() : super('Spanish%20La%20Liga');
// }

// final teamProvider =
//     StateNotifierProvider<TeamNotifier, String>((ref) => TeamNotifier());

final leagueProvider = Provider<ApiServices>((ref) => ApiServices());
final allLeagueDataProvider = FutureProvider<List<AllLeague>>((ref) async {
  return ref.watch(leagueProvider).getAllLeagues();
});
final teamDetailsDataProvider =
    FutureProvider.autoDispose.family<List<Team>, String>((ref, team) async {
  return ref.watch(leagueProvider).getTeamDetails(team);
});
final playerDataProvider = FutureProvider.autoDispose
    .family<List<Player>, String>((ref, player) async {
  return ref.watch(leagueProvider).getPlayer(player);
});

// final teamProvider = StateProvider<String>((ref) => 'Spanish%20La%20Liga');
// final teamProvider2 = Provider((ref) => ref.watch(teamProvider));

// final teamDetailsDataProvider2 =
//     StateNotifierProvider<ApiServices, String>((ref) {
//   return ApiServices();
// });
