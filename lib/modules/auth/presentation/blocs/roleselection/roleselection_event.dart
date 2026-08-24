part of 'roleselection_bloc.dart';

sealed class RoleselectionEvent {}

class  LoadRoleselectionEvent extends RoleselectionEvent {
  final RoleselectionParam param;
   LoadRoleselectionEvent(this.param);
}
