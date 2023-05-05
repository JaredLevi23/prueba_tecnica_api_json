/* 
 * HomeScreen
 * The first screen that is displayed in the application and shows a list of users.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/screens/screens.dart';
import '../../src/models/models.dart';
import '../blocs/users/users_bloc.dart';
import '../widgets/widgets.dart';

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

          // is loading 
          if( state.isLoading ){
            return const LoadingData();
          }

          // is empty
          if( state.userList.isEmpty ){
            return const Center(
              child: Text('Espere por favor...'),
            );
          }

          // user list
          return _UserList( userList: state.userList );

        },
      )

    );
  }
}

// User list
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
