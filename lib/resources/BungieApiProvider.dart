import 'dart:async';
import 'dart:io';
import 'package:fimber/fimber.dart';
import 'package:flutter_playground/models/character_model.dart';
import 'package:flutter_playground/utils/keys.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/player_model.dart';

class BungieApiProvider {

  Client client = Client();
  final Map<String, String> _headers = {
    "X-API-Key": Keys().apiKey
  };

  Future<PlayerModel> fetchPlayer() async {
    Fimber.i("fetchPlayer called");

    final response = await client
        .get("https://www.bungie.net/Platform/Destiny2/SearchDestinyPlayer/4/Jamie92%231135/",
          headers: _headers
        );
    print(response.body.toString());
    if (response.statusCode == 200) { //success
      return PlayerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get player');
    }
  }

  Future<PlayerModel> searchPlayerByName(String player) async {
    String uri = Uri.encodeComponent(player);
    Fimber.i('Searching for player: $uri');

    try {
      final response = await client
          .get("https://www.bungie.net/Platform/Destiny2/SearchDestinyPlayer/-1/" + uri + "/",
          headers: _headers
      );
      Fimber.i(response.body.toString());
      if (response.statusCode == 200) { //success
        PlayerModel temp = PlayerModel.fromJson(json.decode(response.body));
        if(temp.memberships.isEmpty) {
          return PlayerModel.withError('No Players Found!');
        } else
        return temp;
      } else {
        Fimber.e(response.body.toString());
        throw Exception('Failed to get player');
      }
    } catch(error) {

      Fimber.e(error.toString());

      if(error is SocketException) {
        return PlayerModel.withError('No Network Connection!');
      }
      return PlayerModel.withError(error);
    }

  }
  
  Future<CharacterModel> fetchCharacters(String mType, String mId) async {
    Fimber.i("fetchCharacters called");
    
    final response = await client
        .get("https://www.bungie.net/Platform/Destiny2/" + mType +
              "/Profile/" + mId + "/?components=100,200",
          headers: _headers
        );

    print(response.body.toString());
    if (response.statusCode == 200) {
      return CharacterModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get characters');
    }
  }


}