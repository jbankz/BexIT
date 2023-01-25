import 'package:bexit/Common/CommonExports.dart';
import 'package:bexit/Core/App/App.router.dart';
import 'package:bexit/Core/App/AppExports.dart';
import 'package:bexit/Core/Manager/SessionManager.dart';
import 'package:bexit/Core/Router/PageRouterExports.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LauncherViewModel extends BaseViewModel {
  final session = locator<SessionManager>();

  void init() async {
    await session.initilize();
    if (session.isLoggedIn) {
      PageRouter.pushReplacement(Routes.profileView);
    } else {
      PageRouter.pushReplacement(Routes.signinView);
    }
  }
}

class LauncherView extends StatelessWidget {
  const LauncherView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LauncherViewModel>.reactive(
        viewModelBuilder: () => LauncherViewModel(),
        onViewModelReady: (viewModel) => WidgetsBinding.instance
            .addPostFrameCallback((timeStamp) => viewModel.init()),
        builder: (_, viewmodel, __) => BodyWidget(
              config: BodyConfig(body: ListView()),
            ));
  }
}
