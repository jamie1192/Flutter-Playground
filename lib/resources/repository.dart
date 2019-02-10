import 'dart:async';
import '../models/player_model.dart';
import '../resources/BungieApiProvider.dart';

class Repository {
  final bungieApiProvider = BungieApiProvider();

  Future<PlayerModel> fetchPlayer() => bungieApiProvider.fetchPlayer();

  Future<PlayerModel> searchPlayerByName(String player) => bungieApiProvider.searchPlayerByName(player);

}