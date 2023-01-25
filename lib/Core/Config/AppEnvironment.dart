import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  static String get fileName => kReleaseMode ? '.env' : '.env.staging';

  static String get apiUrl => dotenv.env['API_URL'] ?? 'API_URL not found';
}
