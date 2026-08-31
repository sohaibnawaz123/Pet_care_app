import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/forgetpasswordotp/forgetpasswordotp_bloc.dart';


class ForgetpasswordotpView extends StatefulWidget {
  final ForgetpasswordotpBloc bloc;
  const ForgetpasswordotpView({
    super.key,
    required this.bloc,
  });

  @override
  State<ForgetpasswordotpView> createState() => _ForgetpasswordotpViewState();
}

class _ForgetpasswordotpViewState extends State<ForgetpasswordotpView> {
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
