import 'package:flutter/material.dart';

class BodyConfig {
  final Widget? child;
  final Widget? floatingActionButton;
  final String? appBarTitle;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final bool showAppBar;
  final Widget? bottomNavigationBar;
  final EdgeInsets? padding;
  final List<Widget>? tabs;
  final Widget? body;
  final bool showLeadingWidget;
  final List<Widget>? actions;
  final bool loading;
  final String? leadingIcon;

  BodyConfig(
      {this.child,
      this.floatingActionButton,
      this.appBarTitle,
      this.centerTitle = false,
      this.automaticallyImplyLeading = true,
      this.showAppBar = true,
      this.bottomNavigationBar,
      this.padding,
      this.tabs,
      this.body,
      this.showLeadingWidget = false,
      this.actions,
      this.loading = false,
      this.leadingIcon});
}
