// ignore_for_file: constant_identifier_names

enum FirebaseAuthResultStatus {
  Successful('成功'),
  EmailAlreadyExists('このメールアドレスはすでに登録されています。'),
  WrongPassword('パスワードが間違っています。'),
  InvalidEmail('メールアドレスが間違っています。'),
  UserNotFound('このアカウントは存在しません。'),
  UserDisabled('このメールアドレスは無効になっています。'),
  OperationNotAllowed('メールアドレスとパスワードでのログインは有効になっていません。'),
  TooManyRequest('回線が混雑しています。しばらくしてからお試しください。'),
  Undefined('予期せぬエラーが発生しました。');

  final String message;
  const FirebaseAuthResultStatus(this.message);
}
