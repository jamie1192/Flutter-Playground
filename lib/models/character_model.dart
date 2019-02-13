//class CharacterModel {
//
//  int _errorCode;
//  _Profile _profile;
//
//  CharacterModel.fromJson(Map<String, dynamic> parsedJson) {
//    print(parsedJson['Response']);
//
//    _profile = parsedJson['Response'];
//    _errorCode = parsedJson['ErrorCode'];
//  }
//
//  int get errorCode => _errorCode;
//
//
//}
//
//class _Profile {
//
//
//}
//
//class _Characters {
//
//}
//
//class _CharacterData {
//
//  Map<String, _CharacterInfo> characterInfo;
//}
//
//class _CharacterInfo {
//  String _membershipId;
//  int _membershipType;
//  String _characterId;
//  String _dateLastPlayed;
//  String _minutesPlayedThisSession;
//  String _minutesPlayedTotal;
//  int _light;
//  _Stats _stats;
//  int _raceHash;
//  int _genderHash;
//  int _classHash;
//  int _raceType;
//  int _classType;
//  int _genderType;
//  String _emblemPath;
//  String _emblemBackgroundPath;
//  int _emblemHash;
////  _EmblemColor _emblemColor;
////  _LevelProgression _levelProgression;
//  int _baseCharacterLevel;
//  int _percentToNextLevel;
//
//
//
//}
//
//class _Stats {
//
//}

import 'dart:convert';

ProfileCharacterModel playerModelFromJson(String str) {
  final jsonData = json.decode(str);
  return ProfileCharacterModel.fromJson(jsonData);
}

String characterModelToJson(ProfileCharacterModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ProfileCharacterModel {
  Response _response;
  Profile profile;
  CharacterData characterData;
  
  String _error;
//  List<ProfileCharacterModel> _character;

  ProfileCharacterModel(this._response, this._error);

  ProfileCharacterModel.withError(String err) :
      _error = err;

//  ProfileCharacterModel({
//    this.response,
//  });

  factory ProfileCharacterModel.fromJson(Map<String, dynamic> json)  => new ProfileCharacterModel(
    Response.fromJson(json["Response"]),
    null
  );

  Map<String, dynamic> toJson() => {
    "Response": _response.toJson(),
  };

  String get error => _error;
  Response get response => _response;

}

class Response {
  Profile profile;
  List<CharacterData> characters;

  Response({
    this.profile,
    this.characters,
  });

  factory Response.fromJson(Map<String, dynamic> json) {

    List<CharacterData> temp = [];
    for (var key in json['characters']['data'].keys) {

      CharacterData character = CharacterData.fromJson(json['characters']['data'][key]);
      temp.add(character);
    }

    return new Response(
        profile: Profile.fromJson(json["profile"]),
        characters: temp
    );
  }


  Map<String, dynamic> toJson() => {
    "profile": profile.toJson()
//    "characters": characters.toJson(),
  };
}

//class Characters {
//  CharactersData data;
//
//  Characters({
//    this.data,
//  });
//
//  factory Characters.fromJson(Map<String, dynamic> json) => new Characters(
//    data: CharactersData.fromJson(json["data"]),
//  );
//
//  Map<String, dynamic> toJson() => {
//    "data": data.toJson(),
//  };
//}


class CharacterData {
  String membershipId;
  int membershipType;
  String characterId;
  String dateLastPlayed;
  String minutesPlayedThisSession;
  String minutesPlayedTotal;
  int light;
//  Map<String, int> stats;

  CharacterData({
    this.membershipId,
    this.membershipType,
    this.characterId,
    this.dateLastPlayed,
    this.minutesPlayedThisSession,
    this.minutesPlayedTotal,
    this.light,
//    this.stats,
  });

  factory CharacterData.fromJson(Map<String, dynamic> json) => new CharacterData(
    membershipId: json["membershipId"],
    membershipType: json["membershipType"],
    characterId: json["characterId"],
    dateLastPlayed: json["dateLastPlayed"],
    minutesPlayedThisSession: json["minutesPlayedThisSession"],
    minutesPlayedTotal: json["minutesPlayedTotal"],
    light: json["light"],
//    stats: new Map.from(json["stats"]).map((k, v) => new MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "membershipId": membershipId,
    "membershipType": membershipType,
    "characterId": characterId,
    "dateLastPlayed": dateLastPlayed,
    "minutesPlayedThisSession": minutesPlayedThisSession,
    "minutesPlayedTotal": minutesPlayedTotal,
    "light": light,
//    "stats": new Map.from(stats).map((k, v) => new MapEntry<String, dynamic>(k, v)),
  };
}

class Profile {
  ProfileData data;
  int privacy;

  Profile({
    this.data,
    this.privacy,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => new Profile(
    data: ProfileData.fromJson(json["data"]),
    privacy: json["privacy"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "privacy": privacy,
  };
}

class ProfileData {
  UserInfo userInfo;
  String dateLastPlayed;
  int versionsOwned;
  List<String> characterIds;

  ProfileData({
    this.userInfo,
    this.dateLastPlayed,
    this.versionsOwned,
    this.characterIds,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => new ProfileData(
    userInfo: UserInfo.fromJson(json["userInfo"]),
    dateLastPlayed: json["dateLastPlayed"],
    versionsOwned: json["versionsOwned"],
    characterIds: new List<String>.from(json["characterIds"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "userInfo": userInfo.toJson(),
    "dateLastPlayed": dateLastPlayed,
    "versionsOwned": versionsOwned,
    "characterIds": new List<dynamic>.from(characterIds.map((x) => x)),
  };
}

class UserInfo {
  int membershipType;
  String membershipId;
  String displayName;

  UserInfo({
    this.membershipType,
    this.membershipId,
    this.displayName,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => new UserInfo(
    membershipType: json["membershipType"],
    membershipId: json["membershipId"],
    displayName: json["displayName"],
  );

  Map<String, dynamic> toJson() => {
    "membershipType": membershipType,
    "membershipId": membershipId,
    "displayName": displayName,
  };
}