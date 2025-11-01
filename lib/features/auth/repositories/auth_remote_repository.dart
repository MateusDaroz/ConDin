import 'dart:convert';

import 'package:condin/features/auth/models/user.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref){
  return AuthRemoteRepository();
}

class AuthRemoteRepository{
  Future<Either<FlutterError, User>> signup({
    required String username,
    required String email,
    required String password,
  }) async{
    try{
      final response = await http.post(
        Uri.parse("http://localhost:3000/user/signup"),
        headers: {'Content-Type': 'application/json',},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password
          },
        ),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if(response.statusCode != 200){
        return Left(FlutterError(resBodyMap['message']));
      }
      return Right(User.fromMap(resBodyMap));
    } catch (e){
      return Left(FlutterError(e.toString()));
    }
  }

  Future<Either<FlutterError, User>> login({
    required String username,
    required String password,
  }) async{
    try{
      final response = await http.post(
        Uri.parse(""),
        headers: {'Content-Type': 'application/json',},
        body: jsonEncode({
          'username': username,
          'password': password
        },
        ),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if(response.statusCode / 100 != 2){
        return Left(FlutterError(resBodyMap['message']));
      }
      //final tokenService = TokenStorageService();
      //await tokenService.saveToken((resBodyMap['advogado'] as Map<String, dynamic>)['access_token']);
      return Right(User.fromMap(resBodyMap['user']));
    } catch (e){
      return Left(FlutterError(e.toString()));
    }
  }
}