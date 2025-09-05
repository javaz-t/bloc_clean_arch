import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_clean/app_bloc_observer.dart';
import 'package:learn_bloc_clean/bloc/auth_bloc.dart';
import 'package:learn_bloc_clean/pallete.dart';
import 'home_screen.dart';
import 'login_screen.dart';

void main() {
  Bloc.observer =AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        home: const LoginScreen(),
        initialRoute: '/',
        routes: {
           '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
