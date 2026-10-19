/// Thrown by data sources only. Repository implementations catch these and
/// convert them to Failures, so nothing ever throws past the data layer.
class NotFoundException implements Exception {
  const NotFoundException(this.message);
  final String message;
}
