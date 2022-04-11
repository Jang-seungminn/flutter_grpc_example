import 'package:flutter_grpc_example/core/config/config.dart';
import 'package:flutter_grpc_example/core/models/greet/helloworld.pbgrpc.dart';
import 'package:flutter_grpc_example/core/services/greet_service_base.dart';
import 'package:grpc/grpc.dart';

class GreetService extends GreetServiceBase<ClientChannel> {
  @override
  void init({ClientChannel? channel, GreeterClient? client}) async {
    this.channel = channel ??
        ClientChannel(
          await Config.host,
          port: await Config.port,
          options:
              const ChannelOptions(credentials: ChannelCredentials.insecure()),
        );
    this.client = client ??
        GreeterClient(
          this.channel,
          options: CallOptions(timeout: const Duration(seconds: 30)),
        );
  }
}
