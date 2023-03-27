import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ErrorMessageModel extends Equatable{
  bool status;
  String message;

  ErrorMessageModel({required this.status , required this.message});

  @override
  List<Object?> get props => [status , message];
}