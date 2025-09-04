import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CountInceDecScreen extends StatelessWidget {
    CountInceDecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.navigate_before)),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              counterCubit.onIncrement();
            },
             child: const Icon(Icons.add),),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              counterCubit.onDecrement();
            },
             child: const Icon(Icons.minimize),),
        ],
      )
    );
  }
}
