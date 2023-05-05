
/*
 * PhotoViewerScreen
 * This screen shows the selected image
 */

import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/models/photo_model.dart';
import '../widgets/widgets.dart';

class PhotoViewerScreen extends StatelessWidget {

  final PhotoModel photo;
  const PhotoViewerScreen({ Key? key, required this.photo }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon( Icons.close, color: Colors.indigo, ),
          onPressed: ()=> Navigator.pop(context), 
        ),
      ),

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            
            Expanded(
              child: AlbumImage(
                url: photo.url,
              )
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text( photo.title, style: const TextStyle( color: Colors.black54, fontSize: 15 ), ),
            )
          ],
        )
      )

    );
  }
}