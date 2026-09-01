import 'package:flutter/material.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/modules/sitters/presentation/blocs/profilesetup/profilesetup_bloc.dart';


class ProfilesetupView extends StatefulWidget {
  final ProfilesetupBloc bloc;
  const ProfilesetupView({
    super.key,
    required this.bloc,
  });

  @override
  State<ProfilesetupView> createState() => _ProfilesetupViewState();
}

class _ProfilesetupViewState extends State<ProfilesetupView> {
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
