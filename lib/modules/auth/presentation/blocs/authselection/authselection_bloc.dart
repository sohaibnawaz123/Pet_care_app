import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_care_app/core/network/api_response.dart';
import 'package:pet_care_app/core/utils/utils.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/authselection_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/authselection_param.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/authselection_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/authselection_view_initial_params.dart';

part 'authselection_event.dart';
part 'authselection_state.dart';

class AuthselectionBloc extends Bloc<AuthselectionEvent, AuthselectionState> {
  final AuthselectionViewInitialParams initialParams;
  final AuthselectionUseCase _useCase;

  AuthselectionBloc(this.initialParams, this._useCase)
      : super(AuthselectionState(initialParams: initialParams)) {
    on<LoadAuthselectionEvent>(_loadAuthselectionAction);
  }

  Future<void> _loadAuthselectionAction(
      LoadAuthselectionEvent event, Emitter<AuthselectionState> emit) async {
    emit(state.copyWith(authselectionResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(authselectionResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(authselectionResponse: ApiResponse.completed(r)));
      },
    ));
  }
}