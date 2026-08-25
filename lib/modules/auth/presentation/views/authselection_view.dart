import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_care_app/component/button/app_button.dart';
import 'package:pet_care_app/component/image/app_network_image.dart';
import 'package:pet_care_app/core/resource/app_asset.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/core/utils/extension/app_padding.dart';
import 'package:pet_care_app/core/utils/extension/app_sized_box.dart';
import 'package:pet_care_app/core/utils/extension/app_text_style.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/authselection/authselection_bloc.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class AuthselectionView extends StatefulWidget {
  final AuthselectionBloc bloc;
  const AuthselectionView({super.key, required this.bloc});

  @override
  State<AuthselectionView> createState() => _AuthselectionViewState();
}

class _AuthselectionViewState extends State<AuthselectionView>
    with TickerProviderStateMixin {
  late AnimationController _containerController;
  late AnimationController _progressController;

  late Animation<Offset> _containerAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    // Container slide-up animation
    _containerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _containerAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
          CurvedAnimation(parent: _containerController, curve: Curves.easeOut),
        );

    // Progress indicator animation
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 0.60).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    // Start animations sequentially

    _containerController.forward();
    _progressController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    _progressController.dispose();
    super.dispose();
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
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 48, right: 32),
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: AppColor.appPrimary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: AppImage.svg(svgPath: AppAsset.languageIcon, size: 20),
                ),
              ),
            ),
          ),
          Positioned(
            top: -110,
            left: 32,
            right: 32,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: context.mHeight * 0.3),
                AppImage.asset(assetPath: AppAsset.logo, size: double.infinity),
                AnimatedBuilder(
                  animation: _progressController,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      color: AppColor.secondary,
                      backgroundColor: AppColor.lightGrey90,
                      minHeight: 6,
                      value: _progressAnimation.value,
                      borderRadius: BorderRadius.circular(20),
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _containerAnimation,
              child: Container(
                height: context.mHeight * 0.49,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome to',
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
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'To find the best pet sitters in town and ensure exceptional care for your pets',
                      style: context.lightText.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColor.black.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppButton.textButton(
                      title: 'Sign up with Email',
                      width: double.infinity,
                      height: 50,
                      fontColor: AppColor.black,
                      fontSize: 16,
                      radius: 24,
                      // onTap: () {
                      //   context.pushPage(SignupPage());
                      // },
                      // border: BorderSide(color: AppColor.black),
                      buttonColor: AppColor.secondary,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColor.black.withValues(alpha: 0.3),
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'OR',
                            style: context.lightText.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: AppColor.black.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColor.black.withValues(alpha: 0.3),
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    AppButton.iconWithText(
                      title: 'Sign up with Facebook',
                      radius: 24,
                      iconPath: AppAsset.facebook,
                      width: double.infinity,
                      height: 50,
                      fontSize: 16,
                      fontColor: AppColor.black,
                      onTap: () {},
                      borderColor: AppColor.black,
                      buttonColor: Colors.transparent,
                    ),
                    const SizedBox(height: 12),
                    AppButton.iconWithText(
                      title: 'Sign up with Google',
                      radius: 24,
                      iconPath: AppAsset.facebook,
                      width: double.infinity,
                      height: 50,
                      fontSize: 16,
                      fontColor: AppColor.black,
                      onTap: () {},
                      borderColor: AppColor.black,
                      buttonColor: Colors.transparent,
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => context.pushNamed(AppRouteNames.login),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account ? ',
                              style: context.lightText.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.black.withValues(alpha: 0.6),
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: context.lightText.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColor.black,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ).paddingOnly(bottom: MediaQuery.of(context).viewPadding.bottom),
        ],
      ),
    );
  }
}
