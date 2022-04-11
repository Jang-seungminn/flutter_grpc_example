import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_example/core/blocs/greet/greet_bloc.dart';

class GreetForm extends StatefulWidget {
  final String submitLabel;

  final bool submitEnabled;

  final Function(String) onSubmit;
  const GreetForm(
      {Key? key,
      required this.submitLabel,
      this.submitEnabled = true,
      required this.onSubmit})
      : super(key: key);

  @override
  State<GreetForm> createState() => _GreetFormState();
}

class _GreetFormState extends State<GreetForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<GreetBloc, GreetState>(
      listener: (context, state) {
        if (state is GreetInitial) {
          formKey.currentState!.reset();
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (pname) => _name = pname,
              validator: (pname) {
                if (pname!.isEmpty) {
                  return 'Pleases enter a name';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: Text(widget.submitLabel),
                onPressed: widget.submitEnabled
                    ? () async {
                        if (formKey.currentState!.validate()) {
                          widget.onSubmit(_name);
                          setState(() {});
                        }
                      }
                    : null),
          ],
        ),
      ),
    );
  }
}
