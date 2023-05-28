import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneplanet/api/api.dart';
import 'package:phoneplanet/app/pages/dashboard_page.dart';
import 'package:phoneplanet/app/pages/favorites_page.dart';
import 'package:phoneplanet/app/pages/home_page.dart';
import 'package:phoneplanet/app/pages/unauth/personal_data_page.dart';
import 'package:phoneplanet/app/shared/blocs/home_bloc/bloc.dart';
import 'package:phoneplanet/app/shared/blocs/register_bloc/bloc.dart';
import 'package:phoneplanet/design_system/phoneplanet_theme.dart';

import 'pages/unauth/create_password_page.dart';
import 'pages/unauth/welcome_page.dart';

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
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: PhoneplanetTheme.light,
          routes: {
            '/': (context) => const WelcomePage(),
            '/create-password': (context) => const CreatePasswordPage(),
            '/register': (context) => const PersonalDataPage(),
            '/dashboard': (context) => const DashboardPage(),
            '/home': (context) => const HomePage(),
            '/favorites': (context) => const FavoritesPage(),
          },
        ),
      ),
    );
  }
}
