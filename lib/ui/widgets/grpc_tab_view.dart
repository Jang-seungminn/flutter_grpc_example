import 'package:flutter/material.dart';

class GrpcTabView extends StatelessWidget {
  final Widget child;
  const GrpcTabView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: SingleChildScrollView(child: child),
      ),
    );
  }
}
