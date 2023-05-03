import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_tecnica/src/screens/screens.dart';
import 'package:prueba_tecnica/src/models/models.dart';
import '../blocs/users/users_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Users'),
      ),

      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if( state.isLoading ){
            return Column(
              children: const [
                LinearProgressIndicator(
                  minHeight: 10,
                ),
                Expanded(
                  child: Center(
                    child: Text('Espere por favor'),
                  ),
                )
              ],
            );
          }

          if( state.userList.isEmpty ){
            return const Center(
              child: Text('No hay usuarios...'),
            );
          }

          return _UserList( userList: state.userList );

        },
      )

    );
  }
}

class _UserList extends StatelessWidget {
  final List<UserModel> userList;
  const _UserList({Key? key, required this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final usersBloc = BlocProvider.of<UsersBloc>(context, listen: false);

    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (_, index) {
        final user = userList[index];

        return ListTile(
          title: Text(user.name),
          subtitle: Text(user.company.name),
          onTap: (){
            usersBloc.add( ChangeCurrentUserEvent(user: user));
            Navigator.push(context, MaterialPageRoute(builder: (_) => const UserActivityScreen() ));
          },
        );
      }
    );
  }
}
