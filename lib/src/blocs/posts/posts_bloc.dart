
/*
 * PostBloc
 * Manages the status of posts 
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica/src/models/models.dart';
import 'package:prueba_tecnica/src/services/posts_service.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  final PostsService postsService;

  PostsBloc({ required this.postsService }) : super( const PostsState(
    postList: [], 
    currentPost: null, 
    isLoading: false, 
    albumList: [], 
    currentAlbum: null
  )) {

    on<GetActivityListUser>( _onGetActivityList );
    on<ChangeCurrentPostEvent>( _onChangeCurrentPost );
    on<ChangeCurrentAlbumEvent>( _onChangeCurrentAlbum );
    on<IsLoadingEvent>( _onIsLoading );
  }

  /// Is Loading
  FutureOr<void> _onIsLoading(IsLoadingEvent event, Emitter<PostsState> emit) {
    emit( state.copyWith( isLoading: event.isLoading ) );
  }

  /// Change current post
  FutureOr<void> _onChangeCurrentPost(ChangeCurrentPostEvent event, Emitter<PostsState> emit) async {
    add( const IsLoadingEvent(isLoading: true) );
    final comments = await postsService.getCommentsByPost( idPost: event.post.id );
    add( const IsLoadingEvent(isLoading: false) );
    emit( state.copyWith( currentPost: event.post..comments = comments) );
  }

  /// Change current album
  Future<void> _onChangeCurrentAlbum(ChangeCurrentAlbumEvent event, Emitter<PostsState> emit) async {
    add( const IsLoadingEvent(isLoading: true) );
    final photos = await postsService.getPhotosById(albumId: event.album.id);
    add( const IsLoadingEvent(isLoading: false) );
    emit( state.copyWith( currentAlbum: event.album..photos = photos ) );
  }

  /// Get activity list
  FutureOr<void> _onGetActivityList(GetActivityListUser event, Emitter<PostsState> emit)  async {
    add( const IsLoadingEvent(isLoading: true) );
    final posts = await postsService.getPostsByUserId(idUser: event.userId);
    final albums = await postsService.getAlbumListByIdUser(userId: event.userId );
    add( const IsLoadingEvent(isLoading: false) );
    emit( state.copyWith( postList: posts, albumList: albums ) );
  }
}
