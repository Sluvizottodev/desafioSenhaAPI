import 'package:dart_frog/dart_frog.dart';
import 'package:mvl_desafio/app_logger.dart';
import 'package:mvl_desafio/main_middleware.dart';
import 'package:mvl_desafio/payload.dart';

Handler middleware(Handler handler) {
  return handler
      .use(mainMiddleware())
      .use(provider<Future<Payload>>(Payload.fromRequest))
      .use(provider<AppLogger>((_) => AppLogger()));
}
