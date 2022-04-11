part of 'greet_bloc.dart';

@immutable
abstract class GreetState extends Equatable {
  const GreetState();
  @override
  List<Object?> get props => [];
}

class GreetInitial extends GreetState {}

class GreetLoading extends GreetState {}

class GreetOnceSuccess extends GreetState {
  final String result;
  const GreetOnceSuccess(this.result);

  @override
  List<Object?> get props => [result];

  @override
  String toString() {
    return 'GreetOnceSuccess { result : $result }';
  }
}

class GreetFailure extends GreetState {
  final String exception;
  const GreetFailure(this.exception);
  @override
  List<Object?> get props => [exception];
  @override
  String toString() {
    return 'GreetFailure { exception : $exception }';
  }
}
