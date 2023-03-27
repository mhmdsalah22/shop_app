
import '../error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel messageModel;

  ServerException({required this.messageModel});
}