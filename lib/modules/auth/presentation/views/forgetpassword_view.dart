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
import 'package:pet_care_app/modules/auth/presentation/blocs/forgetpassword/forgetpassword_bloc.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class ForgetpasswordView extends StatefulWidget {
  final ForgetpasswordBloc bloc;
  const ForgetpasswordView({super.key, required this.bloc});

  @override
  State<ForgetpasswordView> createState() => _ForgetpasswordViewState();
}

class _ForgetpasswordViewState extends State<ForgetpasswordView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
                  value: 0.95,
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
                  Content(
                    data: 'Forgot your password?',
                    textStyle: context.headingText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      // color: AppColor.black.withValues(alpha: 0.6),
                    ),
                    size: 28,
                    alignment: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  Content(
                    data:
                        'Entered your registered email, and we’ll send a code to reset your password',
                    textStyle: context.lightText.copyWith(
                      fontWeight: FontWeight.w400,
                      // fontSize: 15,
                      color: AppColor.black.withValues(alpha: 0.6),
                    ),
                    size: 14,
                    alignment: TextAlign.left,
                  ),
                  const SizedBox(height: 50),
                  LabelTextField(
                    // labelText: 'Email',
                    validator: (value) => Validator.validateEmail(value ?? ""),
                    hintText: "Email",
                    validateWhileTyping: true,
                  ),

                  const SizedBox(height: 50),
                  Align(
                    alignment: AlignmentGeometry.bottomCenter,
                    child: AppButton.textButton(
                      fontColor: AppColor.black,
                      buttonColor: AppColor.appButton,
                      radius: 24,
                      onTap: () =>
                          context.pushNamed(AppRouteNames.forgetpasswordotp),
                      title: "Send code",
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
