/*
 * Main
 * This is the start of the application
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/screens/screens.dart';
import 'src/blocs/users/users_bloc.dart';
import 'src/blocs/posts/posts_bloc.dart';
import 'src/services/posts_service.dart';
import 'src/services/users_service.dart';

void main() {

  runApp(
    // Blocs
    MultiBlocProvider(
      providers: [

        // Users Bloc
        BlocProvider(
          create: ( BuildContext context ) => UsersBloc( usersService: UsersServices() ) 
        ),

        // Posts Bloc
        BlocProvider(
          create: ( BuildContext context ) => PostsBloc( postsService: PostsService() ) 
        ),

      ],

      // Init
      child: const PruebaTecnicaApp()
    )
  );

}

/// Initial Widget
class PruebaTecnicaApp extends StatelessWidget {
  const PruebaTecnicaApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.blue.shade700
        )
      ),
    );
  }
}