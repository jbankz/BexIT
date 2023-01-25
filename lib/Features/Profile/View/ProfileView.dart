import 'package:bexit/Assets/AppColors.dart';
import 'package:bexit/Common/CommonExports.dart';
import 'package:bexit/Core/Router/PageRouterExports.dart';
import 'package:bexit/Features/Authentication/Views/Password/ChangePasswordView.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'Viewmodel/ProfileViewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewmodel>.reactive(
        viewModelBuilder: () => ProfileViewmodel(),
        onViewModelReady: (viewModel) => viewModel.profile(),
        builder: (_, viewmodel, __) => BodyWidget(
            config: BodyConfig(
                showAppBar: true,
                appBarTitle: 'Account',
                centerTitle: true,
                showLeadingWidget: false,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                loading: viewmodel.isBusy,
                body: ListView(
                  children: [
                    viewmodel.imageFile != null
                        ? CircleAvatar(
                            radius: 100.r,
                            backgroundColor: AppColors.lightBackground,
                            backgroundImage: FileImage(viewmodel.imageFile!))
                        : Center(
                            child: CircularProfileAvatar(
                                viewmodel.userModel?.avatar ?? '',
                                radius: 100.r,
                                backgroundColor: AppColors.primaryLight,
                                foregroundColor:
                                    AppColors.primaryLight.withOpacity(0.5)),
                          ),
                    const Gap(height: 16),
                    TextView(
                        config: TextViewConfig(
                            text: 'Change profile pic',
                            textAlign: TextAlign.center,
                            onTap: () => viewmodel.pickImage())),
                    const Gap(height: 40),
                    ListTile(
                      title: TextView(
                          config: TextViewConfig(
                              text: viewmodel.userModel?.firstname ?? '',
                              textAlign: TextAlign.left,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.black,
                              maxLines: 1)),
                      subtitle: TextView(
                          config: TextViewConfig(
                              text: 'Firstname',
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w400,
                              maxLines: 1)),
                    ),
                    ListTile(
                      title: TextView(
                          config: TextViewConfig(
                              text: viewmodel.userModel?.lastname ?? '',
                              textAlign: TextAlign.left,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.black,
                              maxLines: 1)),
                      subtitle: TextView(
                          config: TextViewConfig(
                              text: 'Lastname',
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w400,
                              maxLines: 1)),
                    ),
                    ListTile(
                      title: TextView(
                          config: TextViewConfig(
                              text: viewmodel.userModel?.email ?? '',
                              textAlign: TextAlign.left,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.black,
                              maxLines: 1)),
                      subtitle: TextView(
                          config: TextViewConfig(
                              text: 'Email',
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w400,
                              maxLines: 1)),
                    ),
                    const Divider(thickness: 1),
                    ListTile(
                        title: TextView(
                            config: TextViewConfig(
                                text: 'Change password',
                                textAlign: TextAlign.left,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                                maxLines: 1,
                                onTap: () => PageRouter.pushWidget(
                                    ChangePasswordView())))),
                    const Divider(thickness: 1),
                    ListTile(
                      title: TextView(
                          config: TextViewConfig(
                              text: 'Delete Account',
                              textAlign: TextAlign.left,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                              maxLines: 1,
                              onTap: () => viewmodel.deleteAccount())),
                    )
                  ],
                ))));
  }
}
