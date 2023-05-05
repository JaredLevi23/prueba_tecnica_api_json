
/*
 * PostScreen
 * This screen shows the selected post
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/posts/posts_bloc.dart';
import '../widgets/widgets.dart';

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
              return const LoadingData();
            }

            final post = state.currentPost;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 10 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  Text( '${post?.title}' ,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800
                    )
                  ),

                  const SizedBox(
                    height: 20,
                  ),
            
                  Text( '${post?.body}' ,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    )
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: const [
                      Expanded(child: Divider( thickness: 2, )),
                      SizedBox( width: 10 ),
                      Icon( Icons.comment, color: Colors.blueGrey ),
                      SizedBox( width: 10 ),
                      Text('Comments',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey
                        )
                      ),
                      SizedBox( width: 10 ),
                      Expanded(child: Divider( thickness: 2, )),
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


