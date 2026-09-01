import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_care_app/component/button/app_button.dart';
import 'package:pet_care_app/component/image/app_network_image.dart';
import 'package:pet_care_app/core/resource/app_asset.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/core/utils/extension/app_edge_insets.dart';
import 'package:pet_care_app/core/utils/extension/app_padding.dart';
import 'package:pet_care_app/core/utils/extension/app_sized_box.dart';
import 'package:pet_care_app/core/utils/extension/app_text_style.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';
import 'package:pet_care_app/modules/app/presentation/bloc/app_bloc.dart';
import 'package:pet_care_app/modules/app/presentation/language_change_wiget.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/roleselection/roleselection_bloc.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class RoleselectionView extends StatefulWidget {
  final RoleselectionBloc bloc;
  const RoleselectionView({super.key, required this.bloc});

  @override
  State<RoleselectionView> createState() => _RoleselectionViewState();
}

class _RoleselectionViewState extends State<RoleselectionView>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController? _fadeController;
  AnimationController? _containerController;
  AnimationController? _textImageController;
  AnimationController? _buttonController;
  AnimationController? _progressController;

  Animation<Offset>? _containerAnimation;
  Animation<Offset>? _textImageAnimation;
  Animation<Offset>? _buttonAnimation;
  Animation<Color?>? _backgroundColorAnimation;
  Animation<double>? _progressAnimation;
  Completer<void>? _resumeCompleter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _backgroundColorAnimation = ColorTween(
      begin: AppColor.primary,
      end: AppColor.white,
    ).animate(_fadeController!);

    _containerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _containerAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
          CurvedAnimation(parent: _containerController!, curve: Curves.easeOut),
        );

    _textImageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _textImageAnimation =
        Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _textImageController!, curve: Curves.easeOut),
        );

    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _buttonAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero).animate(
          CurvedAnimation(parent: _buttonController!, curve: Curves.easeOut),
        );

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 0.25).animate(
      CurvedAnimation(parent: _progressController!, curve: Curves.easeInOut),
    );

    _runIntroAnimations();
  }

  Future<void> _runIntroAnimations() async {
    final fadeController = _fadeController;
    final containerController = _containerController;
    final textImageController = _textImageController;
    final buttonController = _buttonController;
    final progressController = _progressController;

    if (fadeController == null ||
        containerController == null ||
        textImageController == null ||
        buttonController == null ||
        progressController == null) {
      return;
    }

    await fadeController.forward();
    if (!mounted) {
      return;
    }

    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!mounted) {
      return;
    }

    await containerController.forward();
    if (!mounted) {
      return;
    }

    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!mounted) {
      return;
    }

    await textImageController.forward();
    if (!mounted) {
      return;
    }

    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!mounted) {
      return;
    }

    buttonController.forward();
    progressController.forward();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _resumeCompleter?.complete();
    _fadeController?.dispose();
    _containerController?.dispose();
    _textImageController?.dispose();
    _buttonController?.dispose();
    _progressController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fadeController = _fadeController;
    final containerAnimation = _containerAnimation;
    final textImageAnimation = _textImageAnimation;
    final buttonAnimation = _buttonAnimation;
    final progressController = _progressController;
    final progressAnimation = _progressAnimation;

    if (fadeController == null ||
        containerAnimation == null ||
        textImageAnimation == null ||
        buttonAnimation == null ||
        progressController == null ||
        progressAnimation == null) {
      return const Scaffold(backgroundColor: AppColor.primary);
    }

    return AnimatedBuilder(
      animation: fadeController,
      builder: (contex, child) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: _backgroundColorAnimation?.value ?? AppColor.primary,
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
              child: GestureDetector(
                onTap: () => AppLanguage.show(context, bloc: getIt<AppBloc>()),
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
                      child: AppImage.svg(
                        svgPath: AppAsset.languageIcon,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -50,
              left: 32,
              right: 32,
              child: SlideTransition(
                position: textImageAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: context.mHeight * 0.3),
                    AppImage.asset(
                      assetPath: AppAsset.logo,
                      size: double.infinity,
                    ),
                    AnimatedBuilder(
                      animation: progressController,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          color: AppColor.secondary,
                          backgroundColor: AppColor.lightGrey90,
                          minHeight: 6,
                          value: progressAnimation.value,
                          borderRadius: BorderRadius.circular(20),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: containerAnimation,
                child: Container(
                  height: context.mHeight * 0.4,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SlideTransition(
                        position: textImageAnimation,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: translate(context, 'welcome_to'),
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
                      ),
                      const SizedBox(height: 8),
                      SlideTransition(
                        position: textImageAnimation,
                        child: Text(
                          translate(context, 'about_us'),
                          style: context.subHeadingText.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: AppColor.black.withValues(alpha: 0.6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SlideTransition(
                        position: buttonAnimation,
                        child: AppButton(
                          onTap: () => context.pushNamed(
                            AppRouteNames.authselection,
                            extra: {'role': UserRole.petSitter},
                          ),
                          title: translate(context, 'pet_sitter'),
                          width: double.infinity,
                          height: 50,
                          fontColor: AppColor.black,
                          borderColor: AppColor.black,
                          buttonColor: Colors.transparent,
                          radius: 24,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SlideTransition(
                        position: buttonAnimation,
                        child: AppButton.textButton(
                          onTap: () => context.pushNamed(
                            AppRouteNames.authselection,
                            extra: {'role': UserRole.petOwner},
                          ),
                          title: translate(context, 'pet_owner'),
                          width: double.infinity,
                          height: 50,
                          fontColor: AppColor.black,
                          buttonColor: AppColor.secondary,
                          radius: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).paddingOnly(bottom: MediaQuery.of(context).viewPadding.bottom),
          ],
        ),
      ),
    );
  }
}
