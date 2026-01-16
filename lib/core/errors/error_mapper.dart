import 'exceptions.dart';
import 'ui_errors.dart';

extension AppExceptionMapper on AppException {
  UiError toUiError() {
    return switch (this) {
      NetworkException() => const NetworkUiError(),
      ConnectionTimeoutException() => const TimeoutUiError(),
      UnauthorizedException() => const UnauthorizedUiError(),
      ServerException(message: final msg) => ServerUiError(msg),
      ValidationException(message: final msg, errors: final errs) => 
          ValidationUiError(message: msg, fieldErrors: errs),
      CacheException() => const CacheUiError(),
      _ => const UnknownUiError(),
    };
  }
}