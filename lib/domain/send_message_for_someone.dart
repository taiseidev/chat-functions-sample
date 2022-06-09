import 'package:chat_functions_app/data/service/dio_service.dart.dart';
import 'package:chat_functions_app/domain/use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sendMessageForSomeoneUseCaseProvider = Provider(
  (ref) => SendMessageForSomeoneUseCase(
    ref.watch(dioServiceProvider),
  ),
);

class SendMessageForSomeoneUseCase extends UseCase {
  SendMessageForSomeoneUseCase(this._dioDataSource);
  final DioDataSource _dioDataSource;

  @override
  Future<Response> call() async {
    return await _dioDataSource.sendMessageForSomeone();
  }
}
