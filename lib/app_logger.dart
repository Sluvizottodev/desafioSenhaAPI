// ignore_for_file: avoid_print

import 'package:dart_frog/dart_frog.dart';
import 'package:intl/intl.dart';

class AppLogger {
  void info(String message) {
    print(message);
  }

  void error(Object e, [StackTrace? s]) {
    print(e);
    print(s);
  }

  void logRequest(
    RequestContext context,
    int? statusCode,
    Duration elapsedTime,
  ) {
    final Request request = context.request;

    final String ip = request.connectionInfo.remoteAddress.address;

    final String query =
        request.uri.query.isEmpty ? '' : '?${request.uri.query}';

    final String time = DateFormat('dd-MM HH:mm:ss').format(DateTime.now());

    final String method =
        '[${request.method.name.toUpperCase()} $statusCode]'.padLeft(13);

    print('$time $method '
        '${ip.padLeft(10)} '
        '${elapsedTime.inMilliseconds.toString().padLeft(4)}ms '
        '/${request.url.path}$query ');
  }
}
