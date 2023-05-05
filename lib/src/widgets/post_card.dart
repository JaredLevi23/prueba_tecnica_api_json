

import 'package:flutter/material.dart';
import '../models/models.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
    required this.onPressed
  });

  final PostModel post;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: MaterialButton(
        padding: const EdgeInsets.all(10),
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Align(
              alignment: Alignment.centerLeft,
              child: Text( post.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800
                )
              ),
            ),

            const SizedBox(
              height: 20,
            ),
      
            Text( post.body ,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400
              )
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
