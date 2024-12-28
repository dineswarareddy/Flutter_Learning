// features/user_list/viewmodel/user_list_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_learning/model/user_model.dart';
import 'package:api_learning/repo/user_repo.dart';


// State for the ViewModel
class UserListState {
  final List<User> users;
  final bool isLoading;

  UserListState({this.users = const [], this.isLoading = false});

  UserListState copyWith({List<User>? users, bool? isLoading}) {
    return UserListState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// ViewModel as a StateNotifier
class UserListViewModel extends StateNotifier<UserListState> {
  final UserRepository _repository;

  UserListViewModel(this._repository) : super(UserListState());

  Future<void> fetchUsers() async {
    state = state.copyWith(isLoading: true);

    final users = await _repository.fetchUsers();

    state = state.copyWith(users: users, isLoading: false);
  }
}
