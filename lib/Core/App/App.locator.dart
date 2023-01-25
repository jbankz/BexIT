// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';

import '../../Features/Authentication/Domain/Repository/AuthRepositoryImpl.dart';
import '../../Features/Profile/Domain/Repository/ProfileRepositoryImpl.dart';
import '../Manager/PhotoManager.dart';
import '../Manager/SessionManager.dart';
import '../Network/NetworkService.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => SessionManager());
  locator.registerLazySingleton(() => PhotoManager());
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => AuthRepositoryImpl());
  locator.registerLazySingleton(() => ProfileRepositoryImpl());
}
