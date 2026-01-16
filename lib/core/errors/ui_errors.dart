sealed class UiError {
  final String message;
  const UiError(this.message);
}

class GenericUiError extends UiError { const GenericUiError(super.message); }

class NetworkUiError extends UiError {
  const NetworkUiError([super.message = 'Please check your internet connection']);
}

class TimeoutUiError extends UiError {
  const TimeoutUiError([super.message = 'Connection timed out. Please try again']);
}

class UnauthorizedUiError extends UiError {
  const UnauthorizedUiError([super.message = 'Session expired. Please sign in again']);
}

class ServerUiError extends UiError {
  const ServerUiError([super.message = 'Something went wrong. Please try again later']);
}

class ValidationUiError extends UiError {
  final Map<String, List<String>>? fieldErrors;
  const ValidationUiError({String message = 'Please check your input', this.fieldErrors})
      : super(message);

  String? getFieldError(String field) => fieldErrors?[field]?.firstOrNull;
}

class CacheUiError extends UiError {
  const CacheUiError([super.message = 'Failed to load data']);
}

class UnknownUiError extends UiError {
  const UnknownUiError([super.message = 'An unexpected error occurred']);
}

// Note: Add the other specific UI errors (InvalidOtp, AccountExists, etc.) here 
// following the same pattern as needed for your specific flow.