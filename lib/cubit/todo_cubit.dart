 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_clean/model/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  
  void addTodo(String title){
    if(title.isEmpty){
      addError('Title cannot be empty');
      return;
    }
    final todo = Todo(createdAt: DateTime.now(), title: title);
     emit([...state,todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    print(change);
    // TODO: implement onChange
    super.onChange(change);
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    print( 'error $error');
    // TODO: implement onError
    super.onError(error, stackTrace);
  }
}
