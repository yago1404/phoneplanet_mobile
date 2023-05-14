import 'package:flutter/material.dart';
import 'package:phoneplanet/app/pages/dashboard_page.dart';
import 'package:phoneplanet/design_system/phoneplanet_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: PhoneplanetTheme.light,
      routes: {
        '/': (context) => const DashboardPage(),
      },
    );
  }
}
