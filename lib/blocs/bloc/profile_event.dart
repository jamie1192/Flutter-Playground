import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const <dynamic>[]]) : super(props);
}

class FetchProfileEvent extends ProfileEvent {
  final int membershipType;
  final String displayName;

  FetchProfileEvent({this.membershipType, this.displayName}) : super([membershipType, displayName]);

  @override
  String toString() {
    return "FetchProfileEvent: {membershipType: $membershipType, displayName: $displayName }";
  }
}