import 'package:dart_frog/dart_frog.dart';

/// @Allow(*)
Response onRequest(RequestContext context) {
  return Response(statusCode: 204);
}
