import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_learning/provider/user_list_provider.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userListState = ref.watch(userListViewModelProvider);
    final userListViewModel = ref.read(userListViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: userListState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userListState.users.length,
              itemBuilder: (context, index) {
                final user = userListState.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => userListViewModel.fetchUsers(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}