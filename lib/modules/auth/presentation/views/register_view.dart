import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care_app/component/image/app_network_image.dart';
import 'package:pet_care_app/core/resource/app_asset.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/core/utils/extension/app_edge_insets.dart';
import 'package:pet_care_app/core/utils/extension/app_sized_box.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/register/register_bloc.dart';

class RegisterView extends StatefulWidget {
  final RegisterBloc bloc;
  const RegisterView({super.key, required this.bloc});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
            child: LinearProgressIndicator(
              color: AppColor.secondary,
              backgroundColor: AppColor.lightGrey90,
              minHeight: 6,
              value: 0.9,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          Positioned(
            bottom: context.pagePadding.bottom,
            left: context.pagePadding.left,
            right: context.pagePadding.right,
            child: Container(
              width: double.infinity,
              height: context.mHeight * .7,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadow.withValues(alpha: 0.1),offset: Offset(0, 4),
                    blurRadius: 40
                  )
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
