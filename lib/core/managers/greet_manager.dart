import 'package:flutter_grpc_example/core/blocs/greet/greet_bloc.dart';

class GreetManager {
  final GreetBloc greetBloc;
  const GreetManager({required this.greetBloc});

  void add(GreetEvent event) {
    greetBloc.add(event);
  }
}
