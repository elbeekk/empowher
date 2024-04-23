part of 'time_ui_bloc.dart';

@freezed
class TimeUiState with _$TimeUiState {
  const factory TimeUiState({
    required DateTime time,
}) = _TimeUiState;
}
