import 'package:assignment_flutter/presentation/blocs/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Todo List"),
        centerTitle: true,
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            print(state.message);
          } else if (state is TodoSelected) {
            context.go('/detail');
          }
        },
        builder: (context, state) {
          if (state is TodosLoaded) {
            return ListView.builder(
              itemCount: (state.todos.length / 2).ceil(),
              itemBuilder: (context, index) {
                int first = index * 2;
                int second = first + 1;
                return Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<TodoBloc>().add(SelectTodo(state.todos[first]));
                        },
                        child: ListTile(
                          title: Text(state.todos[first].title),
                        ),
                      ),
                    ),
                    if (second < state.todos.length)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.read<TodoBloc>().add(SelectTodo(state.todos[second]));
                          },
                          child: ListTile(
                            title: Text(state.todos[second].title),
                          ),
                        ),
                      )
                    else
                      const Expanded(child: SizedBox()), // empty for odd length
                  ],
                );
              },
            );
          }
          if (state is TodoError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text("Loading..."));
        },
      ),
    );
  }
}