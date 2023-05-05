
/*
 * UsersBloc
 * Manages the status of users 
 * 
*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/users_service.dart';
import '../../../src/models/user_model.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {

  final UsersServices usersService;

  UsersBloc({ required this.usersService }) : super(

    // initial state
    const UsersState( 
      userList: [], 
      currentUser: null, 
      isLoading: false 
  )){

    on<GetUserListEvent>( _onGetUserList );
    on<IsLoadingEvent>( _onIsLoadingEvent );
    on<ChangeCurrentUserEvent>( _onChangeCurrentUser );

    _init();
  }

  _init(){
    add( GetUserListEvent() );
  }

  /// Get user list
  Future<void>_onGetUserList( GetUserListEvent event, Emitter<UsersState> emit) async {
    add( const IsLoadingEvent(isLoading: true) );
    final userList = await usersService.getUserList();
    emit( state.copyWith( userList: userList, isLoading: false ));
  }

  /// Change loading
  FutureOr<void> _onIsLoadingEvent(IsLoadingEvent event, Emitter<UsersState> emit) {
    emit( state.copyWith( isLoading: event.isLoading ) );
  }

  /// Change current user
  FutureOr<void> _onChangeCurrentUser(ChangeCurrentUserEvent event, Emitter<UsersState> emit) {
    emit( state.copyWith( currentUser: event.user ));
  }

}
