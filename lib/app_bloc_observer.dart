import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print('${bloc.runtimeType} created ! ${bloc.state} ');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('  $bloc changed $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(
      '➡️ ${bloc.runtimeType} | ${transition.event} : ${transition.currentState} → ${transition.nextState}',
    );
    super.onTransition(bloc, transition);
  }
}
