import 'package:bexit/Features/Authentication/Views/Signin/SigninView.dart';
import 'package:bexit/Features/Authentication/Views/Signup/SignupView.dart';
import 'package:bexit/Features/Launcher/LauncherView.dart';
import 'package:bexit/Features/Profile/View/ProfileView.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../Features/Authentication/Domain/Repository/AuthRepositoryImpl.dart';
import '../../Features/Authentication/Views/Verification/VerificationView.dart';
import '../../Features/Profile/Domain/Repository/ProfileRepositoryImpl.dart';
import '../Manager/PhotoManager.dart';
import '../Manager/SessionManager.dart';
import '../Network/NetworkService.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LauncherView, initial: true),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: SigninView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: VerificationView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SessionManager),
    LazySingleton(classType: PhotoManager),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: AuthRepositoryImpl),
    LazySingleton(classType: ProfileRepositoryImpl),
  ],
  logger: StackedLogger(),
)
class App {}
