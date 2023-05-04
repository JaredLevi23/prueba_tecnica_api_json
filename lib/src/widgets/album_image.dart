import 'package:flutter/material.dart';

class AlbumImage extends StatelessWidget {

  final String url;
  const AlbumImage({ Key? key, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context){
    try {
      return FadeInImage(
        placeholder: const AssetImage('assets/loading.gif'), 
        imageErrorBuilder: ( _, __, ___ ) => const Image(image: AssetImage('assets/no-image.png')),
        image: NetworkImage(url)
      );
    } catch (e) {
      return const Icon( Icons.image );
    }
  }
}