import 'dart:async';
import 'package:flutter_playground/database/profile_cache.dart';

import '../models/player_model.dart';
import '../resources/BungieApiProvider.dart';

// https://felangel.github.io/bloc/#/flutterangulargithubsearch?id=github-repository

class ProfileRepository {
  final BungieApiProvider apiProvider;
  final ProfileCache cache;

  ProfileRepository({this.apiProvider, this.cache});


  Future<PlayerModel> fetchDestinyPlayer(int mId, String displayName) async {
    if(cache.contains(displayName)) {
      //check cache result age?
      return cache.get(displayName);
    } else {
      return PlayerModel();
    }
  }

}