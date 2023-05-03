part of 'users_bloc.dart';

class UsersState extends Equatable {

  const UsersState({ required this.userList, required this.currentUser, required this.isLoading});

  final List<UserModel> userList;
  final UserModel? currentUser;
  final bool isLoading;

  UsersState copyWith({
    List<UserModel>? userList,
    UserModel? currentUser,
    bool? isLoading
  }){
    return UsersState(
      userList: userList ?? this.userList, 
      currentUser: currentUser ?? this.currentUser,
      isLoading: isLoading ?? this.isLoading
    );
  }
  
  @override
  List<Object> get props => [
    userList,
    isLoading,
    currentUser ?? {}
  ];
}
