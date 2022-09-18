import 'package:first_ios_app/main.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:first_ios_app/second_screen.dart';
import 'package:flutter/material.dart';

import 'counter_cubit.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSetting) {
    final CounterCubit counterCubit = CounterCubit();
    switch (routeSetting.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: counterCubit,
                  child: const MyHomePage(title: 'home'),
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: counterCubit,
                  child: SecondScreen(
                    title: 'home',
                    color: Colors.blue,
                  ),
                ));
      default:
        return null;
    }
  }
}
