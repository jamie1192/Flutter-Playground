import 'package:flutter_playground/blocs/bloc_provider.dart';
import 'package:flutter_playground/models/character_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_playground/models/player_model.dart';
import 'package:flutter_playground/resources/repository.dart';

class PlayerBloc extends BlocBase {

  final _repository = BungieRepository();
  final _playerFetcher = PublishSubject<PlayerModel>();

  final _searchResult = PublishSubject<List<ProfileCharacterModel>>();

  Observable<PlayerModel> get playerSearch => _playerFetcher.stream;
  Observable<List<ProfileCharacterModel>> get getSearchResult => _searchResult.stream;

  fetchPlayer() async {
    PlayerModel playerModel = await _repository.fetchPlayer();
    _playerFetcher.sink.add(playerModel);
  }

  findPlayer(String player) async {
    List<ProfileCharacterModel> model = await _repository.searchPlayerByName(player);
    _searchResult.sink.add(model);
  }

  dispose() {
    _playerFetcher.close();
   _searchResult.close();
  }

}