import 'dart:async';
import 'package:flutter_playground/models/character_model.dart';

import '../models/player_model.dart';
import '../resources/BungieApiProvider.dart';

class Repository {
  final bungieApiProvider = BungieApiProvider();

  Future<PlayerModel> fetchPlayer() => bungieApiProvider.fetchPlayer();

  Future<List<ProfileCharacterModel>> searchPlayerByName(String player) => bungieApiProvider.searchPlayerByName(player);

}