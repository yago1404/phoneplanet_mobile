import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneplanet/api/api.dart';
import 'package:phoneplanet/app/pages/dashboard_page.dart';
import 'package:phoneplanet/app/shared/blocs/home_bloc/bloc.dart';
import 'package:phoneplanet/design_system/phoneplanet_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepository(
            service: MainService(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              productRepository: context.read<ProductRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: PhoneplanetTheme.light,
          routes: {
            '/': (context) => const DashboardPage(),
          },
        ),
      ),
    );
  }
}
