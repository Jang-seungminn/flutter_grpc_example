import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_grpc_example/core/blocs/greet/greet_bloc.dart';
import 'package:flutter_grpc_example/core/managers/greet_manager.dart';
import 'package:flutter_grpc_example/core/services/mobile/greet_service_mobile.dart';
import 'package:flutter_grpc_example/ui/views/app/app_view.dart';
import 'package:provider/provider.dart';

void main() {
  final app = BlocProvider(
    create: (context) => GreetBloc(GreetService()..init()),
    child: Provider(
      create: (context) => GreetManager(
        greetBloc: BlocProvider.of<GreetBloc>(context),
      ),
      child: const MyApp(),
    ),
  );

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
