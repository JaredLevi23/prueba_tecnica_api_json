import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_tecnica/src/blocs/users/users_bloc.dart';
import 'package:prueba_tecnica/src/screens/screens.dart';
import 'package:prueba_tecnica/src/services/posts_service.dart';
import 'package:prueba_tecnica/src/services/users_service.dart';

import 'src/blocs/posts/posts_bloc.dart';


void main() {

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ( BuildContext context ) => UsersBloc( usersService: UsersServices() ) 
        ),
        BlocProvider(
          create: ( BuildContext context ) => PostsBloc( postsService: PostsService() ) 
        ),
      ],
      child: const PruebaTecnicaApp()
    )
  );

}

class PruebaTecnicaApp extends StatelessWidget {
  const PruebaTecnicaApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}