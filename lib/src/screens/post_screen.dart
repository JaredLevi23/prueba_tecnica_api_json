import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/posts/posts_bloc.dart';
import '../models/models.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post'),
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {

            if( state.isLoading ){
              return const Center(
                child: Text('Espere por favor...'),
              );
            }

            final post = state.currentPost;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 10 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  Text( '${post?.title}' ,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    )
                  ),

                  const SizedBox(
                    height: 20,
                  ),
            
                  Text( '${post?.body}' ,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300
                    )
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(child: Container( height: 2, color: Colors.black, margin: const EdgeInsets.only( right: 10 ), )),
                      Text('COMMENTS'),
                      Expanded(child: Container( height: 2, color: Colors.black, margin: const EdgeInsets.only( left: 10 ), )),
                    ],
                  ),
            
                  const SizedBox(
                    height: 20,
                  ),

                  ...post!.comments!.map((e) => CommentDetails( comment: e ) ).toList()
                ],
              ),
            );
          },
        ));
  }
}


class CommentDetails extends StatelessWidget {
  final CommentModel comment;
  const CommentDetails({ Key? key, required this.comment }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 10 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text( 
            comment.body,
            style: const TextStyle(
              fontSize: 15
            )
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Text( 
              comment.email,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            )
          ),

          const SizedBox(
            height: 10,
          ),

          const Divider(
            thickness: 3,
          )

        ],
      ),
    );
  }
}
