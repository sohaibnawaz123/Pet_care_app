part of 'changepassword_bloc.dart';

sealed class ChangepasswordEvent {}

class  LoadChangepasswordEvent extends ChangepasswordEvent {
  final ChangepasswordParam param;
   LoadChangepasswordEvent(this.param);
}
