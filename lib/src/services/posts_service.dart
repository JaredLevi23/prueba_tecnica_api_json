
/*
 * PostsService
 * This class contains the methods to query the information of the api posts.
 */

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/src/models/models.dart';
import 'package:prueba_tecnica/src/models/photo_model.dart';

class PostsService{

  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  /// get posts by user id - return List<PostModel>
  Future<List<PostModel>> getPostsByUserId({ required int idUser }) async {
    try {
      final response = await http.get(
        Uri.parse( '$_baseUrl/users/$idUser/posts' )
      );

      if( response.statusCode == 200 ){
        final List responseDecode = json.decode( response.body );
        return responseDecode.map((e) => PostModel.fromJson( e ) ).toList();
      }
      return [];

    } catch (e) {
      log( 'exception( getPostsbyUserId ): $e' );
      return [];
    }
  }


  /// get comments by post - return List<CommentModel>
  Future<List<CommentModel>> getCommentsByPost({ required int idPost }) async {
    try {
      final response = await http.get(
        Uri.parse( '$_baseUrl/comments?postId=$idPost' )
      );

      if( response.statusCode == 200 ){
        final List responseDecode = json.decode( response.body );
        return responseDecode.map((e) => CommentModel.fromJson( e ) ).toList();
      }
      return [];

    } catch (e) {
      log( 'exception( getCommentsByPost ): $e' );
      return [];
    }
  }

  /// get album list by user id - return List<AlbumModel>
  Future<List<AlbumModel>> getAlbumListByIdUser({ required int userId }) async {
    try {
      final response = await http.get(
        Uri.parse( '$_baseUrl/users/$userId/albums' )
      );

      if( response.statusCode == 200 ){
        final List responseDecode = json.decode( response.body );
        return responseDecode.map((e) => AlbumModel.fromJson( e ) ).toList();
      }
      return [];

    } catch (e) {
      log( 'exception( getAlbumListByIdUser ): $e' );
      return [];
    }
  }

  /// get photos by album id - return List<PhotoModel>
  Future<List<PhotoModel>> getPhotosById({ required int albumId }) async {
    try {
      final response = await http.get(
        Uri.parse( '$_baseUrl/albums/$albumId/photos' )
      );

      if( response.statusCode == 200 ){
        final List responseDecode = json.decode( response.body );
        return responseDecode.map((e) => PhotoModel.fromJson( e ) ).toList();
      }
      return [];

    } catch (e) {
      log( 'exception( getPhotosById ): $e' );
      return [];
    }
  }


}