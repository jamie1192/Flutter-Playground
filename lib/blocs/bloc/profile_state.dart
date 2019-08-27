import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileState extends Equatable {
  ProfileState([List props = const <dynamic>[]]) : super(props);
}

class InitialProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {
  @override
  String toString() => "LoadingProfileState";
}