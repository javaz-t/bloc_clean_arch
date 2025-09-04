import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_clean/counter_cubit.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Theme
             .of(context)
             .colorScheme
             .inversePrimary,
         title: Text(title),
       ),
       body: Center(
         child: BlocBuilder<CounterCubit, int>(
           bloc: counterCubit, //IMP
           builder: (context, state) {
             return Text(
               state.toString(),
             );
           },
         ),
       ),
       floatingActionButton: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           FloatingActionButton(
             onPressed: () {
               counterCubit.onIncrement();
             },
             tooltip: 'Increment',
             child: const Icon(Icons.add),),
           SizedBox(height: 10,),
           FloatingActionButton(
             onPressed: () {
               counterCubit.onDecrement();
             },
             tooltip: 'Decriment',
             child: const Icon(Icons.minimize),),
         ],
       )
            );
  }
}
