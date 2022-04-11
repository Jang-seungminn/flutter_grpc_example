part of 'greet_bloc.dart';

@immutable
abstract class GreetEvent extends Equatable {
  const GreetEvent();
  @override
  List<Object?> get props => [];
}

class GreetReset extends GreetEvent {}

class GreetOnce extends GreetEvent {
  final String name;
  const GreetOnce({required this.name});
  @override
  List<Object?> get props => [name];

  @override
  String toString() {
    return "GreetOnce { name : $name }";
  }
}
