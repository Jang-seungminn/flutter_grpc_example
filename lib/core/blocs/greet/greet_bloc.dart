import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_grpc_example/core/services/greet_service_base.dart';
import 'package:meta/meta.dart';

part 'greet_event.dart';
part 'greet_state.dart';

class GreetBloc extends Bloc<GreetEvent, GreetState> {
  final GreetServiceBase _greetService;

  GreetBloc(this._greetService) : super(GreetInitial()) {
    on<GreetOnce>((event, emit) async {
      final result = await _greetService.greetOnce(event.name);
      emit(GreetOnceSuccess(result));
    });
    on<GreetReset>(((event, emit) {
      emit(GreetInitial());
    }));
  }
}
