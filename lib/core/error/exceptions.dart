import 'package:egybest/core/network/error_message_model.dart';

class ServerExceptions implements Exception {
  ErrorMessageModel errorMessageModel;

  ServerExceptions({required this.errorMessageModel});
}
