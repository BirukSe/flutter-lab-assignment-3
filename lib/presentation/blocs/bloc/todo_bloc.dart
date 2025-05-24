import 'package:assignment_flutter/data/datasource/local_datasource.dart';
import 'package:assignment_flutter/data/datasource/remote_datasource.dart';
import 'package:assignment_flutter/data/models/photo.dart';
import 'package:assignment_flutter/data/models/todo.dart';
import 'package:assignment_flutter/data/repository/todoRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<FetchTodos>((event, emit) async {
      emit(TodoLoading());
      try {
        final todoRepository = TodoRepositoryImpl(remoteDataSource: RemoteDataSource(), localDataSource: LocalDataSource());
        List<TodoModel> todos = await todoRepository.fetchTodos();
        emit(TodosLoaded(todos: todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });

    on<SelectTodo>((event, emit) async {
      emit(TodoLoading());
      try {
        final todoRepository = TodoRepositoryImpl(remoteDataSource: RemoteDataSource(), localDataSource: LocalDataSource());
        List<PhotoModel> photos = await todoRepository.fetchPhotos(event.album.id);
        print("state print ongoing");
        print(photos);
        emit(TodoSelected(todo: event.album, photos: photos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
  }
}