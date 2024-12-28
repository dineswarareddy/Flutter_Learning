import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_learning/viewmodel/user_list_viewModel.dart';
import 'package:api_learning/repo/user_repo.dart';

// class UserListProvider extends StateNotifier<List<UserModel>> {
//   UserListProvider() : super([]);

//   updateUsers(List<UserModel> users) {
//     state = users;
//   }
// }

// Repository provider
final userRepositoryProvider = Provider((ref) => UserRepository());

// ViewModel provider
final userListViewModelProvider = StateNotifierProvider<UserListViewModel, UserListState>(
  (ref) => UserListViewModel(ref.read(userRepositoryProvider)),
);