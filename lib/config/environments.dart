import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get API_KEY_MAPS => dotenv.env['API_KEY_GOOGLE_MAPS']!;
  static String get URL_API_BACKEND => dotenv.env['URL_API_BACKEND']!;
}
