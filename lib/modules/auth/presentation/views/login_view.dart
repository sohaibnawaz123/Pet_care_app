import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_care_app/component/button/app_button.dart';
import 'package:pet_care_app/component/image/app_network_image.dart';
import 'package:pet_care_app/component/text/content.dart';
import 'package:pet_care_app/component/text_field/label_text_field.dart';
import 'package:pet_care_app/core/resource/app_asset.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/core/utils/extension/app_edge_insets.dart';
import 'package:pet_care_app/core/utils/extension/app_padding.dart';
import 'package:pet_care_app/core/utils/extension/app_sized_box.dart';
import 'package:pet_care_app/core/utils/extension/app_text_style.dart';
import 'package:pet_care_app/core/validator/validator.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class LoginView extends StatefulWidget {
  final LoginBloc bloc;
  const LoginView({super.key, required this.bloc});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Stack(
        children: [
          Positioned.fill(
            child: AppImage.asset(
              assetPath: AppAsset.animalFootPatternBg,
              fit: BoxFit.cover,
              size: double.infinity,
            ),
          ),
          Positioned(
            top: context.pagePadding.top + 20,
            left: context.pagePadding.left,
            right: context.pagePadding.right,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SizedBox(height: context.mHeight * 0.1),
                LinearProgressIndicator(
                  color: AppColor.secondary,
                  backgroundColor: AppColor.lightGrey90,
                  minHeight: 6,
                  value: 0.9,
                  borderRadius: BorderRadius.circular(20),
                ),
                SizedBox(height: context.mHeight * 0.08),
                AppImage.asset(assetPath: AppAsset.logo, size: double.infinity),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.topCenter,
              height: context.mHeight * 0.45,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(
                // physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Log in to',
                            style: context.headingText.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' Furry Sitterz',
                            style: context.headingText.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Content(
                    data:
                        'To find the best pet sitters in town and ensure exceptional care for your pets',
                    textStyle: context.lightText.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColor.black.withValues(alpha: 0.6),
                    ),
                    alignment: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  LabelTextField(
                    // labelText: 'Email',
                    validator: (value) => Validator.validateEmail(value ?? ""),
                    hintText: "Email",
                    validateWhileTyping: true,
                  ),
                  // _LoginEmailInput(),
                  const SizedBox(height: 10),
                  LabelTextField(
                    obscureText: true,
                    hintText: 'Password',
                    validator: (value) =>
                        Validator.validatePassword(value ?? ""),
                    validateWhileTyping: true,
                  ),
                  // _LoginPassswordInput(),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          AppRouteNames.forgetpassword,
                          extra: {"role": widget.bloc.initialParams.role},
                        );
                      },
                      child: Text(
                        'Forgot password',
                        style: context.bodyText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: AlignmentGeometry.bottomCenter,
                    child: AppButton.textButton(
                      fontColor: AppColor.black,
                      buttonColor: AppColor.appButton,
                      radius: 24,
                      // height: 40,
                      title: "Login",
                    ),
                  ),
                  // _LoginSubmit(),
                  // const SizedBox(height: 12),
                ],
              ),
            ),
          ).paddingOnly(bottom: context.pagePadding.bottom),
        ],
      ),
    );
  }
}
