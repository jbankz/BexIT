import '../App/App.logger.dart';

enum Analytics { signup, login }

class AnalyticManager {
  final logger = getLogger('AnalyticManager');

  AnalyticManager._internal();
}
