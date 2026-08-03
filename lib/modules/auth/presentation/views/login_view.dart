import 'package:flutter/material.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/login/login_bloc.dart';


class LoginView extends StatefulWidget {
  final LoginBloc bloc;
  const LoginView({
    super.key,
    required this.bloc,
  });

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
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.base,

      
    );
  
  }
}
