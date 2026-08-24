import 'package:flutter/material.dart';
import 'package:pet_care_app/core/resource/app_color.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/roleselection/roleselection_bloc.dart';


class RoleselectionView extends StatefulWidget {
  final RoleselectionBloc bloc;
  const RoleselectionView({
    super.key,
    required this.bloc,
  });

  @override
  State<RoleselectionView> createState() => _RoleselectionViewState();
}

class _RoleselectionViewState extends State<RoleselectionView> {
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
