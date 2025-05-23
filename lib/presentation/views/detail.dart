import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment_flutter/presentation/blocs/bloc/todo_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){context.go('/');},),
            const Text('Todo Detail'),
          ],
        ),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
  builder: (context, state) {
    if (state is TodoSelected) {
      final todo = state.todo;
      final photo = state.photos;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('ID: ${todo.id}'),
            const SizedBox(height: 24),
            if (photo.thumbnailUrl != null)
              // Image.(photo.thumbnailUrl, width: 100, height: 100),
              Text("Fucking image goes here"),
            Text(photo.title),
          ],
        ),
      );
    } else if (state is TodoError) {
      print(state.message);
      return Center(child: Text("Not connected to Internet,are you poor?", style: const TextStyle(color: Colors.red)));
    }
    else if(state is TodoLoading){
      return const Center(child: CircularProgressIndicator());
    }
    // Return a fallback widget for other states
    return const Center(child: Text('No todo selected.'));
  },
)
    );
  }
}