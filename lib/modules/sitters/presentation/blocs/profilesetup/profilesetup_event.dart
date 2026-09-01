part of 'profilesetup_bloc.dart';

sealed class ProfilesetupEvent {}

class  LoadProfilesetupEvent extends ProfilesetupEvent {
  final ProfilesetupParam param;
   LoadProfilesetupEvent(this.param);
}
