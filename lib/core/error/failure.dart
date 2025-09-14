abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerError extends Failure {
  ServerError(String message) : super(message);
}
