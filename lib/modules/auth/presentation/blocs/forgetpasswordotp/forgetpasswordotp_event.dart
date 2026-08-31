part of 'forgetpasswordotp_bloc.dart';

sealed class ForgetpasswordotpEvent {}

class  LoadForgetpasswordotpEvent extends ForgetpasswordotpEvent {
  final ForgetpasswordotpParam param;
   LoadForgetpasswordotpEvent(this.param);
}
