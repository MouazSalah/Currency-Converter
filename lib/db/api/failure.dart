import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ApiError extends Failure {
  const ApiError(String errorMessage) : super(errorMessage);
}

class ApiFailure extends Failure {
  const ApiFailure(String errorMessage) : super(errorMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(String errorMessage) : super(errorMessage);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String errorMessage) : super(errorMessage);
}

class ParsingFailure extends Failure {
  const ParsingFailure(String errorMessage) : super(errorMessage);
}
