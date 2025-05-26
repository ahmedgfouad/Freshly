// import 'package:dio/dio.dart';

// abstract class Failure {
//   String errorMessage;
//   Failure(this.errorMessage);
// }

// class ServerFailure extends Failure {
//   ServerFailure(super.errorMessage);

//   factory ServerFailure.fromDioError(DioException dioErro) {
//     switch (dioErro.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure("Connection timeout with ApiServer");
//       case DioExceptionType.sendTimeout:
//         return ServerFailure("Send timeout with ApiServer");
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure("Receive timeout with ApiServer");
//       case DioExceptionType.badCertificate:
//         return ServerFailure("bad certificate");
//       case DioExceptionType.badResponse:
//         return ServerFailure.fromResponse(
//           dioErro.response!.statusCode,
//           dioErro.response!.data,
//         );
//       case DioExceptionType.cancel:
//         return ServerFailure("Request to ApiServer was canceld");
//       case DioExceptionType.connectionError:
//         return ServerFailure("Connected was erro , please tyr later");

//       case DioExceptionType.unknown:
//         if (dioErro.message!.contains("SocketException")) {
//           return ServerFailure("No Internet Connection");
//         } else {
//           return ServerFailure("Unexpected Error , please try later!");
//         }
//     }
//   }

//   factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//       return ServerFailure(response['error']['message']);
//     } else if (statusCode == 404) {
//       return ServerFailure("Your Request not found , please try later");
//     } else if (statusCode == 500) {
//       return ServerFailure("Internal Server error , please try later");
//     } else {
//       return ServerFailure("Opps there was an Error , please try again ");
//     }
//   }
// }
