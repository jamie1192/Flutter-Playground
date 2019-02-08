import 'package:rxdart/rxdart.dart';
import 'package:flutter_playground/models/player_model.dart';
import 'package:flutter_playground/resources/repository.dart';

class PlayerBloc {

  final _repository = Repository();
  final _playerFetcher = PublishSubject<PlayerModel>();

  Observable<PlayerModel> get playerSearch => _playerFetcher.stream;

  fetchPlayer() async {
    PlayerModel playerModel = await _repository.fetchPlayer();
    _playerFetcher.sink.add(playerModel);
  }

  dispose() {
    _playerFetcher.close();
  }

}

final bloc = PlayerBloc();