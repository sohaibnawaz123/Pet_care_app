class NetworkResponse<T> {
  final T data;
  final int? statusCode;
  final Map<String, String>? headers;

  const NetworkResponse({
    required this.data,
    this.statusCode,
    this.headers,
  });
}
