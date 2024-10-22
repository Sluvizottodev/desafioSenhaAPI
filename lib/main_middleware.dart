import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'exceptions/app_exception.dart';
import 'extension/context_ext.dart';
import 'extension/response_ext.dart';

Middleware mainMiddleware() {
  return (Handler handler) {
    return (RequestContext context) async {
      final Stopwatch watch = Stopwatch()..start();
      int? statusCode;

      try {
        final Response response = await handler(context);

        statusCode = response.statusCode;

        return await context.withDelay(response);
      } on AppException catch (e) {
        statusCode = e.statusCode;

        return e.response.statusCode >= 500
            ? e.response.updateHeader('intentional_error', 'true')
            : e.response;
      } catch (e, s) {
        context.logger.error(e, s);

        statusCode = HttpStatus.internalServerError;
        return Response.json(
          statusCode: HttpStatus.internalServerError,
          headers: <String, String>{'intentional_error': 'false'},
        );
      } finally {
        watch.stop();
        context.logger.logRequest(context, statusCode, watch.elapsed);
      }
    };
  };
}
