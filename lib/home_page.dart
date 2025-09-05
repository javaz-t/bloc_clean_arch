import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_clean/bloc/counter_bloc.dart';
import 'package:learn_bloc_clean/count_ince_dec_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
         // bloc: counterCubit, required only if we did nt add provider bloc
          builder: (context, state) {
            return Text(state.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CountInceDecScreen()),
          );
        },
      ),
    );
  }
}
