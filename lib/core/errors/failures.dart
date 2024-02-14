import 'package:dio/dio.dart';
///import 'package:flutter/foundation.dart';

abstract class Failure{
  final String errMessage;

  Failure( this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure( super.errMessage);
  factory ServerFailure.fromDioException(DioException dioException){
       switch (dioException.type) 
       {

         case DioExceptionType.connectionTimeout:
              return ServerFailure('Connection timeout with server');
         case DioExceptionType.sendTimeout:
              return ServerFailure('Send timeout with server');
         case DioExceptionType.receiveTimeout:
              return ServerFailure('Recieve timeout with server');
         case DioExceptionType.badCertificate:
              return ServerFailure('BadCertificate with server');
         case DioExceptionType.badResponse:
              return ServerFailure.fromBadResponse(dioException.response!.statusCode!, dioException.response!.data);
         case DioExceptionType.cancel:
              return ServerFailure('Request was cancelled');
         case DioExceptionType.connectionError:
              return ServerFailure('connectionError');
         case DioExceptionType.unknown:
              if (dioException.message!.contains('SocketException')){
                return ServerFailure('no internet connection');
              }
              return ServerFailure('Unexpected');
           default:
           return ServerFailure('Unexpected');   
        } 
        }




factory ServerFailure.fromBadResponse(int statusCode, dynamic badResponse ){
  if(statusCode ==400 || statusCode ==401 || statusCode==403){
      return ServerFailure(badResponse ['error']['message']);
  } else if (statusCode==404){
      return ServerFailure('your request not found');
  }else if (statusCode==500){
    return ServerFailure('internal server error');
  }else{
    return ServerFailure('oops try again');
  }
}
}