import 'package:equatable/equatable.dart';

abstract class FullscreenState extends Equatable {
  FullscreenState([List props = const <dynamic>[]]) : super(props);
}

class InitialFullscreenState extends FullscreenState {}

class FullScreenLoadingState extends FullscreenState{}

class FullScreenErrorState extends FullscreenState{}

class TaskDoneState extends FullscreenState{}
