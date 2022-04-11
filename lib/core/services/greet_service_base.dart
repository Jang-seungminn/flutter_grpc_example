import 'package:grpc/grpc_connection_interface.dart';

import '../models/models.dart';

abstract class GreetServiceBase<C extends ClientChannelBase> {
  late C channel;
  late GreeterClient client;
  void init({C channel, GreeterClient client});

  Future<String> greetOnce(String name) async {
    final greeting = HelloRequest()..name = name;
    // final request = HelloRequest(name: greeting.toString());

    final response = await client.sayHello(greeting);
    return response.message;
  }
}
