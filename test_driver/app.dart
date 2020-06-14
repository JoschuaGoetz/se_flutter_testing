import 'package:flutter_driver/driver_extension.dart';
import 'package:sepokedex/main.dart' as app;

void main() {
  // Enable the flutter driver extension to run and capture tests
  enableFlutterDriverExtension();

  // Configure things here before the app is launched.

  // Execute the main app
  app.main();
}
