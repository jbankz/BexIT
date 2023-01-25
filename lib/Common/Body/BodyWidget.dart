import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Assets/AppColors.dart';
import '../../Core/Router/PageRouter.dart';
import '../Image/ImageView.dart';
import '../Image/Model/ImageConfig.dart';
import '../Progressbar/SimpleLoader.dart';
import '../TextView/Models/TextViewConfig.dart';
import '../TextView/TextView.dart';
import 'Model/BodyConfig.dart';

class BodyWidget extends StatelessWidget {
  final BodyConfig? config;

  const BodyWidget({required this.config, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.scaffold100,
          appBar: config!.showAppBar
              ? AppBar(
                  centerTitle: config!.centerTitle,
                  automaticallyImplyLeading: config!.automaticallyImplyLeading,
                  actions: config?.actions,
                  leadingWidth: 40,
                  backgroundColor: AppColors.scaffold,
                  elevation: 0,
                  leading: config!.showLeadingWidget
                      ? IconButton(
                          color: AppColors.black,
                          onPressed: () => PageRouter.pop(),
                          icon: Icon(Icons.close))
                      : null,
                  title: TextView(
                    config: TextViewConfig(
                      text: config?.appBarTitle ?? '',
                      fontSize: 20,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      color: AppColors.accent,
                    ),
                  ),
                  bottom:
                      config?.tabs != null ? TabBar(tabs: config!.tabs!) : null,
                )
              : null,
          body: SafeArea(
            minimum: config?.padding ?? EdgeInsets.zero,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: config?.body,
            ),
          ),
          bottomNavigationBar: config?.bottomNavigationBar,
          floatingActionButton: config!.floatingActionButton,
        ),
        Visibility(
            visible: config!.loading,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(.2),
              child: const SimpleLoader(),
            ))
      ],
    );
  }
}
