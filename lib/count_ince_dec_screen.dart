import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_clean/bloc/counter_bloc.dart';


class CountInceDecScreen extends StatelessWidget {
    CountInceDecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.navigate_before)),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              counterCubit.add(CounterIncrement());
            },
             child: const Icon(Icons.add),),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
         counterCubit.add(CounterDecrement());
            },
             child: const Icon(Icons.minimize),),
        ],
      )
    );
  }
}
