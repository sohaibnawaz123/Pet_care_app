import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_care_app/core/network/api_response.dart';
import 'package:pet_care_app/core/utils/utils.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/roleselection_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/roleselection_param.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/roleselection_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/roleselection_view_initial_params.dart';

part 'roleselection_event.dart';
part 'roleselection_state.dart';

class RoleselectionBloc extends Bloc<RoleselectionEvent, RoleselectionState> {
  final RoleselectionViewInitialParams initialParams;
  final RoleselectionUseCase _useCase;

  RoleselectionBloc(this.initialParams, this._useCase)
      : super(RoleselectionState(initialParams: initialParams)) {
    on<LoadRoleselectionEvent>(_loadRoleselectionAction);
  }

  Future<void> _loadRoleselectionAction(
      LoadRoleselectionEvent event, Emitter<RoleselectionState> emit) async {
    emit(state.copyWith(roleselectionResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(roleselectionResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(roleselectionResponse: ApiResponse.completed(r)));
      },
    ));
  }
}