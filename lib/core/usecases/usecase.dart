import 'package:dartz/dartz.dart';
import 'package:trust_task/core/errors/ui_errors.dart';

abstract class UseCase<Type, Params> {
  Future<Either<UiError, Type>> call(Params params);
}

class NoParams {}