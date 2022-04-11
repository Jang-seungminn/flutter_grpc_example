import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_example/core/blocs/greet/greet_bloc.dart';
import 'package:flutter_grpc_example/ui/views/views.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('gRPC Demo'),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text('Unary'),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<GreetBloc>(context).add(GreetReset());
                },
                icon: const Icon(Icons.refresh),
                tooltip: 'Reset',
              )
            ],
          ),
          body: const TabBarView(children: [
            UnaryView(),
          ]),
        ));
  }
}
