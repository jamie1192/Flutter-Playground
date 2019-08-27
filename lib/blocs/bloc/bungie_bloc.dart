import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class DestinyPlayerBloc extends Bloc<DestinyProfileEvent, DestinyPlayerState> {
  @override
  DestinyPlayerState get initialState => InitialBungieState();

  @override
  Stream<DestinyPlayerState> mapEventToState(DestinyProfileEvent event) async* {
    if(event is FetchPlayerEvent) yield* _mapFetchPlayerToState(event);
    
  }
    
  Stream<DestinyPlayerState> _mapFetchPlayerToState(FetchPlayerEvent event) async* {
    try {

    } catch(err) {

    }
  }
  
}
