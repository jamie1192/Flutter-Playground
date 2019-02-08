class PlayerModel {
  int _errorCode;

  List<_Membership> _memberships = [];

  PlayerModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['Response']);

    _errorCode = parsedJson['ErrorCode'];

    List<_Membership> temp = [];

    for (int i = 0; i < parsedJson['Response'].length; i++) {
      _Membership membership = _Membership(parsedJson['Response'][i]);
      temp.add(membership);
    }
    _memberships = temp;
  }

  int get errorCode => _errorCode;
  List<_Membership> get memberships => _memberships;

}

class _Membership {
  int _mType;
  String _mId;
  String _displayName;

  int get mType => _mType;
  String get mId => _mId;
  String get displayName => _displayName;

  _Membership(membership) {
    _mId = membership['membershipId'];
    _mType = membership['membershipType'];
    _displayName = membership['displayName'];
  }

}

