import 'list_response.dart';

class TankerkoenigListResponseError extends TankerkoenigListResponse {
  final String message;

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
