import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_ui_event.dart';

part 'time_ui_state.dart';

part 'time_ui_bloc.freezed.dart';

class TimeUiBloc extends Bloc<TimeUiEvent, TimeUiState> {
  TimeUiBloc() : super(TimeUiState(time: DateTime.now())) {
    on<ChangeState>((event, emit) {
      emit(state.copyWith(time: DateTime.now()));
    });
  }
}
