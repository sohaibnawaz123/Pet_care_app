import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_care_app/core/network/api_response.dart';
import 'package:pet_care_app/core/utils/utils.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/forgetpasswordotp_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/forgetpasswordotp_param.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/forgetpasswordotp_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/forgetpasswordotp_view_initial_params.dart';

part 'forgetpasswordotp_event.dart';
part 'forgetpasswordotp_state.dart';

class ForgetpasswordotpBloc extends Bloc<ForgetpasswordotpEvent, ForgetpasswordotpState> {
  final ForgetpasswordotpViewInitialParams initialParams;
  final ForgetpasswordotpUseCase _useCase;

  ForgetpasswordotpBloc(this.initialParams, this._useCase)
      : super(ForgetpasswordotpState(initialParams: initialParams)) {
    on<LoadForgetpasswordotpEvent>(_loadForgetpasswordotpAction);
  }

  Future<void> _loadForgetpasswordotpAction(
      LoadForgetpasswordotpEvent event, Emitter<ForgetpasswordotpState> emit) async {
    emit(state.copyWith(forgetpasswordotpResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(forgetpasswordotpResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(forgetpasswordotpResponse: ApiResponse.completed(r)));
      },
    ));
  }
}