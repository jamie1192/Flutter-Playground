import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class DestinyPlayerBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  ProfileState get initialState => InitialProfileState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if(event is FetchProfileEvent) yield* _mapFetchPlayerToState(event);
    
  }
    
  Stream<ProfileState> _mapFetchPlayerToState(FetchProfileEvent event) async* {
    try {

    } catch(err) {

    }
  }
  
}
