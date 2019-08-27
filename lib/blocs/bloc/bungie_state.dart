import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DestinyPlayerState extends Equatable {
  DestinyPlayerState([List props = const <dynamic>[]]) : super(props);
}

class InitialBungieState extends DestinyPlayerState {}

class BungieLoadingState extends DestinyPlayerState {
  @override
  String toString() => "BungieLoadingState";
}