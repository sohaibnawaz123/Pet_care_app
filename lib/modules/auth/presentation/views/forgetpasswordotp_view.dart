import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_care_app/component/button/app_button.dart';
import 'package:pet_care_app/component/image/app_network_image.dart';
import 'package:pet_care_app/component/text/content.dart';
import 'package:pet_care_app/core/resource/app_asset.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/core/utils/extension/app_edge_insets.dart';
import 'package:pet_care_app/core/utils/extension/app_sized_box.dart';
import 'package:pet_care_app/core/utils/extension/app_text_style.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/forgetpasswordotp/forgetpasswordotp_bloc.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetpasswordotpView extends StatefulWidget {
  final ForgetpasswordotpBloc bloc;
  const ForgetpasswordotpView({super.key, required this.bloc});

  @override
  State<ForgetpasswordotpView> createState() => _ForgetpasswordotpViewState();
}

class _ForgetpasswordotpViewState extends State<ForgetpasswordotpView> {
  late final PinInputController _otpController;

  @override
  void initState() {
    super.initState();
    _otpController = PinInputController();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
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
                  const SizedBox(height: 8),
                  Content(
                    data:
                        'We’ve sent a 4-digit code to your email. Please enter it below to verify your identity.',
                    textStyle: context.lightText.copyWith(
                      fontWeight: FontWeight.w400,
                      // fontSize: 15,
                      color: AppColor.black.withValues(alpha: 0.6),
                    ),
                    size: 14,
                    alignment: TextAlign.left,
                  ),
                  const SizedBox(height: 50),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Enter code ',
                          style: context.bodyText.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                        ),
                        TextSpan(
                          text: ' (e.g., 1234)',
                          style: context.lightText.copyWith(
                            // fontWeight: FontWeight.w500,
                            // fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  MaterialPinField(
                    length: 4,
                    pinController: _otpController,
                    keyboardType: TextInputType.number,
                    autoFocus: true,
                    autoDismissKeyboard: true,
                    enableAutofill: true,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    onChanged: (_) {},
                    theme: MaterialPinTheme(
                      shape: MaterialPinShape.outlined,
                      cellSize: const Size(58, 62),
                      spacing: 12,
                      borderRadius: BorderRadius.circular(16),
                      borderWidth: 1.2,
                      focusedBorderWidth: 1.8,
                      fillColor: AppColor.white,
                      focusedFillColor: AppColor.primary,
                      filledFillColor: AppColor.primary,
                      borderColor: AppColor.lightGrey90,
                      focusedBorderColor: AppColor.secondary,
                      filledBorderColor: AppColor.secondary,
                      cursorColor: AppColor.black,
                      textStyle: context.headingText.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      hintCharacter: '-',
                      hintStyle: context.headingText.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: AppColor.lightGrey50,
                      ),
                      entryAnimation: MaterialPinAnimation.fade,
                      animationDuration: const Duration(milliseconds: 200),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Didn’t receive a code? ',
                          style: context.bodyText.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' Resend Code',
                          style: context.lightText.copyWith(
                            color: AppColor.black,
                            decoration: TextDecoration.underline,
                            // fontWeight: FontWeight.w500,
                            // fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),

                  const SizedBox(height: 50),
                  Align(
                    alignment: AlignmentGeometry.bottomCenter,
                    child: AppButton.textButton(
                      fontColor: AppColor.black,
                      buttonColor: AppColor.appButton,
                      radius: 24,
                      onTap: () =>
                          context.pushNamed(AppRouteNames.changepassword),
                      // height: 40,
                      title: "Continue",
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
