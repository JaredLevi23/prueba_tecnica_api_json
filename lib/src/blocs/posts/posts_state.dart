part of 'posts_bloc.dart';

class PostsState extends Equatable {

  const PostsState({ required this.postList, required this.currentPost, required this.isLoading, required this.albumList, required this.currentAlbum });

  final List<PostModel> postList;
  final List<AlbumModel> albumList;
  final PostModel? currentPost;
  final AlbumModel? currentAlbum;
  final bool isLoading;

  PostsState copyWith({
    List<PostModel>? postList,
    List<AlbumModel>? albumList,
    PostModel? currentPost,
    AlbumModel? currentAlbum,
    bool? isLoading
  })=> PostsState(
    postList: postList ?? this.postList,
    albumList: albumList ?? this.albumList,
    currentPost: currentPost ?? this.currentPost, 
    currentAlbum: currentAlbum ?? this.currentAlbum,
    isLoading: isLoading ?? this.isLoading,
  );
  
  @override
  List<Object> get props => [
    postList,
    albumList,
    currentPost ?? {},
    currentAlbum ?? {},
    isLoading
  ];
}

