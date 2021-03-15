import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await Firebase.initializeApp();
  // From: https://docs.sentry.io/platforms/flutter/
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://933eba7715fd44808418c588b581a173@o551699.ingest.sentry.io/5675369';
    },
    appRunner: () => runApp(MyApp()),
  );
}
