import 'list_response.dart';

/// TankerkoenigListResponseError
class TankerkoenigListResponseError extends TankerkoenigListResponse {
  final String message;

  /// Implementation of TankerkoenigListResponse to set an error case
  TankerkoenigListResponseError(
    this.message,
  ) : super(
          false,
          null,
          null,
          null,
          null,
          message,
        );
}
