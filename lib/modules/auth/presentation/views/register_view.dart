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
            top: 80,
            bottom: context.pagePadding.bottom,
            left: context.pagePadding.left,
            right: context.pagePadding.right,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: context.pagePadding.left,
                horizontal: context.pagePadding.left,
              ),
              width: double.infinity,
              height: context.mHeight * .8,
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
              child: FieldSection(),
            ),
          ),
        ],
      ),
    );
  }
}

class FieldSection extends StatelessWidget {
  const FieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Sign up to',
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
        10.heightBox,
        Content(
          data:
              'To find the best pet sitters in town and ensure exceptional care for your pets',
          textStyle: context.bodyText,
        ),
        20.heightBox,
        LabelTextField(
          // labelText: 'Email',
          validator: (value) =>
              Validator.validateFullName(value ?? "", 'joe john'),
          hintText: "Name",
          validateWhileTyping: true,
        ),
        20.heightBox,
        LabelTextField(
          // labelText: 'Email',
          validator: (value) =>
              Validator.validateFullName(value ?? "", 'Eg: jeojohn'),
          hintText: "Username",
          validateWhileTyping: true,
        ),
        20.heightBox,
        LabelTextField(
          // labelText: 'Email',
          validator: (value) => Validator.validateEmail(value ?? ""),
          hintText: "Email",
          validateWhileTyping: true,
        ),
        20.heightBox,
        LabelTextField(
          // labelText: 'Email',
          validator: (value) => Validator.validatePassword(value ?? ""),
          hintText: "Password",
          validateWhileTyping: true,
        ),
        20.heightBox,
        LabelTextField(
          // labelText: 'Email',
          validator: (value) => Validator.validatePassword(value ?? ""),
          hintText: "Re-type Password",
          validateWhileTyping: true,
        ),
        50.heightBox,
        AppButton.textButton(
          title: 'Next',
          fontColor: AppColor.black20,
          buttonColor: AppColor.appButton,
          radius: 24,
        ),
      ],
    );
  }
}
