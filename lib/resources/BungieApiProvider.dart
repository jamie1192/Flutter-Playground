import 'dart:async';
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
    print("fetchPlayer called");

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
  
  Future<CharacterModel> fetchCharacters(String mType, String mId) async {
    print("fetchCharacters called");
    
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