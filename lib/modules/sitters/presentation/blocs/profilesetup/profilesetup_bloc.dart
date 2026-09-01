import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_care_app/core/network/api_response.dart';
import 'package:pet_care_app/core/utils/utils.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/sitters/domain/entities/profilesetup_entity.dart';
import 'package:pet_care_app/modules/sitters/domain/params/profilesetup_param.dart';
import 'package:pet_care_app/modules/sitters/domain/usecase/profilesetup_use_case.dart';
import 'package:pet_care_app/modules/sitters/presentation/routes/profilesetup_view_initial_params.dart';

part 'profilesetup_event.dart';
part 'profilesetup_state.dart';

class ProfilesetupBloc extends Bloc<ProfilesetupEvent, ProfilesetupState> {
  final ProfilesetupViewInitialParams initialParams;
  final ProfilesetupUseCase _useCase;

  ProfilesetupBloc(this.initialParams, this._useCase)
      : super(ProfilesetupState(initialParams: initialParams)) {
    on<LoadProfilesetupEvent>(_loadProfilesetupAction);
  }

  Future<void> _loadProfilesetupAction(
      LoadProfilesetupEvent event, Emitter<ProfilesetupState> emit) async {
    emit(state.copyWith(profilesetupResponse: ApiResponse.loading()));
    
    await _useCase.execute(event.param).then((value) => value.fold(
      (l) {
        emit(state.copyWith(profilesetupResponse: ApiResponse.error(l.error)));
      }, 
      (r) {
        emit(state.copyWith(profilesetupResponse: ApiResponse.completed(r)));
      },
    ));
  }
}