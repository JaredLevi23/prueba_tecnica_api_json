import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/models/user_model.dart';

import '../../services/users_service.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {

  final UsersServices usersService;

  UsersBloc({ required this.usersService }) : super( const UsersState( userList: [], currentUser: null, isLoading: false )){

    on<GetUserListEvent>( _onGetUserList );
    on<GetUserById>( _onGetUserById );
    on<IsLoadingEvent>( _onIsLoadingEvent );
    on<ChangeCurrentUserEvent>( _onChangeCurrentUser );

    _init();
  }

  _init(){
    add( GetUserListEvent() );
  }

  Future<void>_onGetUserList( GetUserListEvent event, Emitter<UsersState> emit) async {
    add( const IsLoadingEvent(isLoading: true) );
    final userList = await usersService.getUserList();
    emit( state.copyWith( userList: userList, isLoading: false ));
  }

  Future<void>_onGetUserById( GetUserById event, Emitter<UsersState> emit) async {

    final idUser = event.idUser;
    final user = await usersService.getUserById(idUser: idUser);

    if( user != null ){
      print( user.toRawJson() );
      emit( state.copyWith( currentUser: user ));
    }
  }

  FutureOr<void> _onIsLoadingEvent(IsLoadingEvent event, Emitter<UsersState> emit) {
    emit( state.copyWith( isLoading: event.isLoading ) );
  }

  FutureOr<void> _onChangeCurrentUser(ChangeCurrentUserEvent event, Emitter<UsersState> emit) {
    print( event.user.toJson() );
    emit( state.copyWith( currentUser: event.user ));
  }
}
