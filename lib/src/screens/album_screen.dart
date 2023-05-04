import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/blocs/posts/posts_bloc.dart';
import 'package:prueba_tecnica/src/screens/screens.dart';

import '../widgets/widgets.dart';

class AlbumScreen extends StatelessWidget {

  const AlbumScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('${ context.watch<PostsBloc>().state.currentAlbum?.title }'),
      ),

      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {

          if( state.isLoading ){
            return const Center(
              child: Text('Espere por favor...'),
            );
          }

          if( state.currentAlbum?.photos == null || state.currentAlbum!.photos!.isEmpty ){
            return const Center(
              child: Text('No hay fotos en el album'),
            );
          }

          final photos = state.currentAlbum!.photos;

          return ListView.builder(
            itemCount: photos!.length,
            itemBuilder: (_, index){

              final photo = photos[ index];

              return Padding(
                padding: const EdgeInsets.symmetric( vertical: 5 ),
                child: ListTile(
                  title: Text( photo.title ),
                  leading: AlbumImage(url: photo.url),
                  onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (_) => PhotoViewerScreen( photo: photo, ))),
                ),
              );
            }
          );
        },
      ),
    );
  }
}


