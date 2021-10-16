import 'detail_response.dart';

/// TankerkoenigDetailResponseError
class TankerkoenigDetailResponseError extends TankerkoenigDetailResponse {
  final String message;

  /// Implementation of TankerkoenigDetailResponseError to set an error case
  TankerkoenigDetailResponseError(
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
