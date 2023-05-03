import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/blocs/users/users_bloc.dart';

class UserActivityScreen extends StatefulWidget {

  const UserActivityScreen({Key? key}) : super(key: key);

  @override
  State<UserActivityScreen> createState() => _UserActivityScreenState();
}

class _UserActivityScreenState extends State<UserActivityScreen> with TickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final usersBloc = BlocProvider.of<UsersBloc>(context);

    return Scaffold(
        
      appBar: AppBar(
        title: Text('${ usersBloc.state.currentUser?.name }'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon( Icons.post_add_sharp ), text: 'POSTS',),
            Tab(icon: Icon( Icons.photo_album ), text: 'ALBUM',),
          ],
          onTap: ( index ){

          },
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text('POSTS'),
          ),
          Center(
            child: Text('ALBUM'),
          ),
        ]
      )

    );
  }
}
