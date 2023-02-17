import 'package:flutter/material.dart';
import 'package:input_example/pages/login_page.dart';
import 'package:input_example/pages/search_page.dart';
import 'package:input_example/routes/app_router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
    routeInformationParser: _appRouter.defaultRouteParser(),);
  }
}
