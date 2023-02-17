import 'package:auto_route/annotations.dart';
import 'package:input_example/pages/login_page.dart';

import '../pages/search_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: LoginPage, initial: true),
  AutoRoute<String>(page: SearchPage)
])
class $AppRouter {}
