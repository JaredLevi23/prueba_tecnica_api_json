part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}


class GetUserListEvent extends UsersEvent{}

class GetUserById extends UsersEvent{
  final int idUser;
  const GetUserById({ required this.idUser });
}

class ChangeCurrentUserEvent extends UsersEvent{
  final UserModel user;
  const ChangeCurrentUserEvent({ required this.user});
}

class IsLoadingEvent extends UsersEvent{
  final bool isLoading;
  const IsLoadingEvent({ required this.isLoading});
}

