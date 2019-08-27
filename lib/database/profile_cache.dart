import 'package:flutter_playground/models/player_model.dart';

class ProfileCache {
  //TODO

  final _cache = <String, PlayerModel>{};

  PlayerModel get(String displayName) => _cache[displayName];

  void set(String displayName, PlayerModel player)  => _cache[displayName] = player;
  
  bool contains(String displayName) => _cache.containsKey(displayName);

  void remove(String displayName) => _cache.remove(displayName);
}