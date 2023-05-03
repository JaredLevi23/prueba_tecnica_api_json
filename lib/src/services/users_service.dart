
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/src/models/user_model.dart';

class UsersServices{

  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  // get user list - return List<UserModel>
  Future<List<UserModel>> getUserList() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/users')
      );
      
      if( response.statusCode == 200 ){
        final List responseDecode = json.decode( response.body );
        return responseDecode.map((e) => UserModel.fromJson( e ) ).toList();
      }

      return [];
    } on Exception catch (e) {
      log( 'exception( getUserList ): $e' );
      return [];
    }
  }

  /// get user by id - return UserModel?
  Future<UserModel?> getUserById({ required int idUser }) async {
    try {
      final response = await http.get(
        Uri.parse( '$_baseUrl/users/$idUser' )
      );

      if( response.statusCode == 200 ){
        return UserModel.fromRawJson( response.body );
      }
      return null;

    } catch (e) {
      log( 'exception( getUserById ): $e' );
      return null;
    }
  }

  

}