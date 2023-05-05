
/*
 * UserActivityScreen
 * This screen shows the posts and albums of the selected user
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_tecnica/src/blocs/users/users_bloc.dart';
import 'package:prueba_tecnica/src/screens/screens.dart';
import 'package:prueba_tecnica/src/widgets/widgets.dart';

import '../blocs/posts/posts_bloc.dart';

class UserActivityScreen extends StatefulWidget {
  const UserActivityScreen({Key? key}) : super(key: key);

  @override
  State<UserActivityScreen> createState() => _UserActivityScreenState();
}

class _UserActivityScreenState extends State<UserActivityScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    final postsBloc = BlocProvider.of<PostsBloc>(context, listen: false);
    final usersBloc = BlocProvider.of<UsersBloc>(context, listen: false);
    postsBloc.add( GetActivityListUser( userId: usersBloc.state.currentUser!.id ) );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final usersBloc = BlocProvider.of<UsersBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${usersBloc.state.currentUser?.name}'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.post_add_sharp),
              text: 'POSTS',
            ),
            Tab(
              icon: Icon(Icons.photo_album),
              text: 'ALBUM',
            ),
          ],
          onTap: (index) {},
        ),
      ),
      body: TabBarView(
        
        controller: _tabController, 
      
        children: const [
          _PostList(),
         _AlbumList()
        ]
      )
    );
  }
}


// Post List
class _PostList extends StatelessWidget {

  const _PostList();

  @override
  Widget build(BuildContext context) {

    final postsBloc = BlocProvider.of<PostsBloc>(context);

    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {

        if( state.isLoading ){
          return const LoadingData();
        }

        if( state.postList.isEmpty ){
          return const Center(
            child: Text('No hay publicaciones'),
          );
        }

        final posts = state.postList;

        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, index) {

            final post = posts[index];

            return PostCard(
              post: post,
              onPressed: (){
                postsBloc.add( ChangeCurrentPostEvent(post: post));
                Navigator.push(context, MaterialPageRoute(builder: (_) => const PostScreen() ));
              },
            );
          },
        );
      },
    );
  }
}

// Album List
class _AlbumList extends StatelessWidget {

  const _AlbumList();

  @override
  Widget build(BuildContext context) {

    final postsBloc = BlocProvider.of<PostsBloc>(context);

    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {

       if( state.isLoading ){
         return const LoadingData();
       }

       if( state.albumList.isEmpty ){
         return const Center(
           child: Text('No hay albums'),
         );
       }

       final albums = state.albumList;

       return ListView.builder(
         itemCount: albums.length,
           itemBuilder: (_, index){

             final album = albums[ index ];
    
             return ListTile(
               title: Text( album.title ,
                 style: const TextStyle(
                   fontSize: 17,
                   fontWeight: FontWeight.w400
                 )
               ),
               leading: const CircleAvatar(
                 backgroundColor: Colors.grey,
                 child: Icon( Icons.insert_photo_sharp, color: Colors.white, ),
               ),
               onTap: (){
                 postsBloc.add( ChangeCurrentAlbumEvent(album: album));
                 Navigator.push(context, MaterialPageRoute(builder: (_) => const AlbumScreen()));
               },
             );
           }
         );
      },
    );
  }
}

