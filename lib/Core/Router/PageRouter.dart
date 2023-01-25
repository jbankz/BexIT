import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../Core/App/App.locator.dart';

class PageRouter {
  static final _navigation = locator<NavigationService>();

  static Future<void> pushNamed(String routeName, {dynamic args}) async =>
      await _navigation.navigateTo(routeName, arguments: args);

  static Future<void> pushWidget(Widget view, {dynamic args}) async =>
      await _navigation.navigateToView(view);

  static bool pop() => _navigation.back();

  static void popToRoot() => _navigation.popUntil((route) => route.isFirst);

  static Future<void> pushReplacement(String routeName, {dynamic args}) async =>
      await _navigation.clearStackAndShow(routeName, arguments: args);
}
