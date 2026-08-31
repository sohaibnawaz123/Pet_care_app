import 'package:flutter/material.dart';
import 'package:pet_care_app/component/button/app_button.dart';
import 'package:pet_care_app/component/image/app_network_image.dart';
import 'package:pet_care_app/component/text/content.dart';
import 'package:pet_care_app/component/text_field/label_text_field.dart';
import 'package:pet_care_app/core/resource/app_asset.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/core/utils/extension/app_edge_insets.dart';
import 'package:pet_care_app/core/utils/extension/app_sized_box.dart';
import 'package:pet_care_app/core/utils/extension/app_text_style.dart';
import 'package:pet_care_app/core/validator/validator.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/changepassword/changepassword_bloc.dart';

class ChangepasswordView extends StatefulWidget {
  final ChangepasswordBloc bloc;
  const ChangepasswordView({super.key, required this.bloc});

  @override
  State<ChangepasswordView> createState() => _ChangepasswordViewState();
}

class _ChangepasswordViewState extends State<ChangepasswordView> {
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

                // SizedBox(height: context.mHeight * 0.08),
              ],
            ),
          ),

          Positioned(
            top: 80,
            bottom: context.pagePadding.bottom,
            left: context.pagePadding.left,
            right: context.pagePadding.right,
            child: Container(
              alignment: Alignment.topCenter,
              height: context.mHeight * 0.8,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: context.pagePadding.left,
                horizontal: context.pagePadding.left,
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadow.withValues(alpha: 0.1),
                    offset: Offset(0, 4),
                    blurRadius: 40,
                  ),
                ],
              ),
              child: ListView(
                // physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Content(
                    data: 'Change Password',
                    textStyle: context.headingText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      // color: AppColor.black.withValues(alpha: 0.6),
                    ),
                    size: 28,
                    alignment: TextAlign.left,
                  ),

                  const SizedBox(height: 50),

                  LabelTextField(
                    hintText: "New Password",
                    obscureText: true,
                    validateWhileTyping: true,
                    validator: (p0) => Validator.validatePassword(p0 ?? ""),
                  ),
                  const SizedBox(height: 20),
                  LabelTextField(
                    hintText: "Confirm Password",
                    obscureText: true,
                    validateWhileTyping: true,
                    validator: (p0) => Validator.validatePassword(p0 ?? ""),
                  ),
                  // LabelTextField(),

                  const SizedBox(height: 50),
                  Align(
                    alignment: AlignmentGeometry.bottomCenter,
                    child: AppButton.textButton(
                      fontColor: AppColor.black,
                      buttonColor: AppColor.appButton,
                      radius: 24,
                      // height: 40,
                      title: "Reset password",
                    ),
                  ),
                  // _LoginSubmit(),
                  // const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
