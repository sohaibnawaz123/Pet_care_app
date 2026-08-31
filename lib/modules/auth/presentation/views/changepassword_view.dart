import 'package:flutter/material.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/changepassword/changepassword_bloc.dart';


class ChangepasswordView extends StatefulWidget {
  final ChangepasswordBloc bloc;
  const ChangepasswordView({
    super.key,
    required this.bloc,
  });

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
      backgroundColor: AppColor.base,

      
    );
  
  }
}
