import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_example/core/blocs/greet/greet_bloc.dart';
import 'package:flutter_grpc_example/ui/widgets/greet_form.dart';
import 'package:flutter_grpc_example/ui/widgets/grpc_tab_view.dart';

class UnaryView extends StatelessWidget {
  static const description =
      'Implementation of a unary RPC. The client sends a static request and receives a static response.';
  const UnaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GrpcTabView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(description),
        ),
        GreetForm(
          submitLabel: "Submit",
          onSubmit: (name) {
            BlocProvider.of<GreetBloc>(context).add(GreetOnce(name: name));
          },
        ),
        const SizedBox(
          height: 100,
        ),
        Text(
          'Response',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          child: BlocBuilder<GreetBloc, GreetState>(
            builder: (context, state) {
              if (state is GreetOnceSuccess) {
                return Text(state.result);
              } else if (state is GreetLoading) {
                return const AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator(),
                );
              } else if (state is GreetFailure) {
                return Text(
                  '${state.exception.runtimeType}: ${state.exception}',
                  textAlign: TextAlign.center,
                );
              } else {
                return const Text('No data');
              }
            },
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
