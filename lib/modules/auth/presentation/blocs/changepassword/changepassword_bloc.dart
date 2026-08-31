import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_care_app/core/network/api_response.dart';
import 'package:pet_care_app/core/utils/utils.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/changepassword_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/changepassword_param.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/changepassword_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/changepassword_view_initial_params.dart';

part 'changepassword_event.dart';
part 'changepassword_state.dart';

class ChangepasswordBloc extends Bloc<ChangepasswordEvent, ChangepasswordState> {
  final ChangepasswordViewInitialParams initialParams;
  final ChangepasswordUseCase _useCase;

  ChangepasswordBloc(this.initialParams, this._useCase)
      : super(ChangepasswordState(initialParams: initialParams)) {
    on<LoadChangepasswordEvent>(_loadChangepasswordAction);
  }

  Future<void> _loadChangepasswordAction(
      LoadChangepasswordEvent event, Emitter<ChangepasswordState> emit) async {
    emit(state.copyWith(changepasswordResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(changepasswordResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(changepasswordResponse: ApiResponse.completed(r)));
      },
    ));
  }
}