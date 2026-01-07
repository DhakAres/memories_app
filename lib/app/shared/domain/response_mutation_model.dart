class ResponseMutationModel<T> {
  final String message;
  final bool success;
  final T? data;

  ResponseMutationModel(
      {required this.message, required this.success, this.data});
}
