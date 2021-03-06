import 'package:rxdart/rxdart.dart';
import 'package:flutter_playground/models/player_model.dart';
import 'package:flutter_playground/resources/repository.dart';

class PlayerBloc {

  final _repository = Repository();
  final _playerFetcher = PublishSubject<PlayerModel>();

  final _searchResult = PublishSubject<PlayerModel>();

  Observable<PlayerModel> get playerSearch => _playerFetcher.stream;
  Observable<PlayerModel> get getSearchResult => _searchResult.stream;

  fetchPlayer() async {
    PlayerModel playerModel = await _repository.fetchPlayer();
    _playerFetcher.sink.add(playerModel);
  }

  findPlayer(String player) async {
    PlayerModel model = await _repository.searchPlayerByName(player);
    _searchResult.sink.add(model);
  }

  dispose() {
    _playerFetcher.close();
//    _searchResult.close();
  }

}

final bloc = PlayerBloc();