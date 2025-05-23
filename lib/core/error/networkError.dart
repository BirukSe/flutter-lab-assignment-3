class NetworkError implements Exception {
  final String message;
  final int statusCode;
  final bool isOperational;
  final dynamic details;

  NetworkError({
    required this.message,
    this.statusCode = 500,
    this.details,
    this.isOperational = true,
  });

  // Internet connection specific error
  factory NetworkError.noInternet({
    String message = 'No Internet Connection', 
    dynamic details,
  }) {
    return NetworkError(
      message: message,
      statusCode: 0, // Using 0 as status code for no internet
      details: details,
    );
  }

  // Common HTTP error factories
  factory NetworkError.badRequest({
    String message = 'Bad Request', 
    dynamic details,
  }) {
    return NetworkError(
      message: message,
      statusCode: 400,
      details: details,
    );
  }

  factory NetworkError.unauthorized({
    String message = 'Unauthorized', 
    dynamic details,
  }) {
    return NetworkError(
      message: message,
      statusCode: 401,
      details: details,
    );
  }

  factory NetworkError.notFound({
    String message = 'Not Found', 
    dynamic details,
  }) {
    return NetworkError(
      message: message,
      statusCode: 404,
      details: details,
    );
  }

  factory NetworkError.timeout({
    String message = 'Request Timeout', 
    dynamic details,
  }) {
    return NetworkError(
      message: message,
      statusCode: 408,
      details: details,
    );
  }

  factory NetworkError.conflict({
    String message = 'Conflict', 
    dynamic details,
  }) {
    return NetworkError(
      message: message,
      statusCode: 409,
      details: details,
    );
  }

  factory NetworkError.serverError({
    String message = 'Internal Server Error', 
    dynamic details,
  }) {
    return NetworkError(
      message: message,
      statusCode: 500,
      details: details,
      isOperational: false,
    );
  }

  factory NetworkError.serviceUnavailable({
    String message = 'Service Unavailable', 
    dynamic details,
  }) {
    return NetworkError(
      message: message,
      statusCode: 503,
      details: details,
    );
  }

  // Check if error is due to internet connection
  bool get isNoInternetError => statusCode == 0;

  // Convert error to map for serialization
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'statusCode': statusCode,
      'details': details,
      'isInternetError': isNoInternetError,
      if (isOperational) 'isOperational': isOperational,
    };
  }

  @override
  String toString() {
    return 'NetworkError(message: $message, statusCode: $statusCode, '
           'details: $details, isOperational: $isOperational)';
  }
}