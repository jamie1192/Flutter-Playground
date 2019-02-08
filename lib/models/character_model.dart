class CharacterModel {

  int _errorCode;
  _Profile _profile;

  CharacterModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['Response']);

    _profile = parsedJson['Response'];
    _errorCode = parsedJson['ErrorCode'];
  }

  int get errorCode => _errorCode;


}

class _Profile {


}

class _Characters {

}

class _CharacterData {

  Map<String, _CharacterInfo> characterInfo;
}

class _CharacterInfo {
  String _membershipId;
  int _membershipType;
  String _characterId;
  String _dateLastPlayed;
  String _minutesPlayedThisSession;
  String _minutesPlayedTotal;
  int _light;
  _Stats _stats;
  int _raceHash;
  int _genderHash;
  int _classHash;
  int _raceType;
  int _classType;
  int _genderType;
  String _emblemPath;
  String _emblemBackgroundPath;
  int _emblemHash;
//  _EmblemColor _emblemColor;
//  _LevelProgression _levelProgression;
  int _baseCharacterLevel;
  int _percentToNextLevel;



}

class _Stats {

}