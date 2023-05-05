
/*
 * CommentsDetails
 * Create a comment
 */

import 'package:flutter/material.dart';
import '../models/models.dart';

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
              fontSize: 16,
              fontWeight: FontWeight.w300
            )
          ),

          const SizedBox(
            height: 10,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text( 
                  comment.email,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blueGrey,
                  child: Icon( Icons.person, color: Colors.white, ),
                ),
              ],
            )
          ),

          const SizedBox(
            height: 5,
          ),

          const Divider(
            thickness: 3,
          )

        ],
      ),
    );
  }
}
