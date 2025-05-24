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
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                context.go('/');
              },
            ),
            const Text('Todo Detail'),
          ],
        ),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
         listener: (context, state) {
          if (state is TodoError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
                print(state.message);
          }
         },
        
        builder: (context, state) {
          if (state is TodoSelected) {
            final photo = state.photos;

            return ListView.builder(
              itemCount: photo.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        photo[index].thumbnailUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(photo[index].title),
                    ),
                  ),
                );
              },
            );
          } else if (state is TodoError) {
            print(state.message);
            return const Center(
              child: Text(
                "Not connected to Internet, are you poor?",
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return const Center(child: Text('No todo selected.'));
        },
      ),
    );
  }
}
