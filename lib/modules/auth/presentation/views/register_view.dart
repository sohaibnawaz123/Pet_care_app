import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/register/register_bloc.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class RegisterView extends StatefulWidget {
  final RegisterBloc bloc;
  const RegisterView({super.key, required this.bloc});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _fullName.addListener(_updateFormValidity);
    _userName.addListener(_updateFormValidity);
    _email.addListener(_updateFormValidity);
    _password.addListener(_updateFormValidity);
    _confirmPassword.addListener(_updateFormValidity);
  }

  void _updateFormValidity() {
    final isValid =
        Validator.validateFullName(_fullName.text, 'joe john') == null &&
        Validator.validateFullName(_userName.text, 'Eg: jeojohn') == null &&
        Validator.validateEmail(_email.text) == null &&
        Validator.validatePassword(_password.text) == null &&
        Validator.validatePassword(_confirmPassword.text) == null &&
        _password.text == _confirmPassword.text;

    if (_isFormValid != isValid) {
      setState(() => _isFormValid = isValid);
    }
  }

  @override
  void dispose() {
    _fullName.dispose();
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
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
              child: FieldSection(
                role: widget.bloc.initialParams.role,
                fullName: _fullName,
                userName: _userName,
                email: _email,
                password: _password,
                confirmPassword: _confirmPassword,
                isFormValid: _isFormValid,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FieldSection extends StatelessWidget {
  final UserRole? role;
  final TextEditingController fullName;
  final TextEditingController userName;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final bool isFormValid;
  const FieldSection({
    super.key,
    this.role,
    required this.fullName,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.isFormValid,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
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
            controller: fullName,
            // labelText: 'Email',
            validator: (value) =>
                Validator.validateFullName(value ?? "", 'joe john'),
            hintText: "Name",
            validateWhileTyping: true,
          ),
          20.heightBox,
          LabelTextField(
            controller: userName,
            // labelText: 'Email',
            validator: (value) =>
                Validator.validateFullName(value ?? "", 'Eg: jeojohn'),
            hintText: "Username",
            validateWhileTyping: true,
          ),
          20.heightBox,
          LabelTextField(
            controller: email,
            // labelText: 'Email',
            validator: (value) => Validator.validateEmail(value ?? ""),
            hintText: "Email",
            validateWhileTyping: true,
          ),
          20.heightBox,
          LabelTextField(
            controller: password,
            // labelText: 'Email',
            validator: (value) => Validator.validatePassword(value ?? ""),
            hintText: "Password",
            validateWhileTyping: true,
          ),
          20.heightBox,
          LabelTextField(
            controller: confirmPassword,
            // labelText: 'Email',
            validator: (value) {
              final passwordError = Validator.validatePassword(value ?? '');
              if (passwordError != null) return passwordError;
              if (value != password.text) return 'Passwords do not match';
              return null;
            },
            hintText: "Re-type Password",
            validateWhileTyping: true,
          ),
          50.heightBox,
          AppButton(
            
            onTap: isFormValid && role == UserRole.petSitter
                ? () => context.pushNamed(AppRouteNames.sittersProfileSetup)
                : null,
            isDisable: !isFormValid,
            
            title: 'Next',
            fontColor: AppColor.black20,
            buttonColor: AppColor.appButton,
            radius: 24,
          ),
        ],
      ),
    );
  }

  // bool checkValue()
}
