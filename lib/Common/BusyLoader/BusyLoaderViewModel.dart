import 'package:stacked/stacked.dart';

import '../../Core/App/App.logger.dart';

class BusyLoaderViewModel<T> extends BaseViewModel {
  final logger = getLogger('BusyLoaderViewModel');

  Future<T?> runAsyncTask(Future<T> busyFuture) async {
    try {
      return await runBusyFuture(busyFuture, throwException: true);
    } catch (e) {
      logger.e('ErrorType: ${e.runtimeType}\nErrorMessage: ${e.toString()}');
      return null;
    }
  }
}
