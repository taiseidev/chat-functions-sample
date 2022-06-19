import 'package:chat_functions_app/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_page_state.freezed.dart';

@freezed
class TopPageState with _$TopPageState {
  const factory TopPageState({
    UserModel? user,
    @Default(false) bool isLoading,
    @Default(false) bool isDisplayDialog,
  }) = _TopPageState;
}
