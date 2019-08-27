import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DestinyProfileEvent extends Equatable {
  DestinyProfileEvent([List props = const <dynamic>[]]) : super(props);
}

class FetchPlayerEvent extends DestinyProfileEvent {
  final int membershipType;
  final String displayName;

  FetchPlayerEvent({this.membershipType, this.displayName}) : super([membershipType, displayName]);

  @override
  String toString() {
    return "FetchPlayerEvent: {membershipType: $membershipType, displayName: $displayName }";
  }
}