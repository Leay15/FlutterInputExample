import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:input_example/pages/search_page.dart';
import 'package:input_example/routes/app_router.gr.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _title = "Hello";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_title),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    filled: true),
                validator: (value) {
                  if (value?.isEmpty ?? false) return "Must not be empty";
                  if (!EmailValidator.validate(value ?? ""))
                    return "Email is not valid";
                  return null;
                },
                onSaved: (value) {
                  _title = value ?? _title;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Input a Password",
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    filled: true),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) return "Must not be empty";
                  if ((value?.length ?? 0) < 8) return "Password is too short";
                  return null;
                },
                onSaved: (value) {
                  _title = value ?? _title;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    var responseValue =
                        await AutoRouter.of(context).push<String>(
                      SearchRoute(query: _title,callback: (result){

                      }),
                    );

                    setState(() {
                      _title = responseValue as String;
                    });
                  }
                },
                child: const Text("Recuperar Valor"))
          ],
        ),
      ),
    );
  }
}
