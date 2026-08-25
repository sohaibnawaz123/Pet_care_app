part of 'authselection_bloc.dart';

sealed class AuthselectionEvent {}

class  LoadAuthselectionEvent extends AuthselectionEvent {
  final AuthselectionParam param;
   LoadAuthselectionEvent(this.param);
}
