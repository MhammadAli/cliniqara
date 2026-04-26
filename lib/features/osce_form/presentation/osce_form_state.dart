import 'package:equatable/equatable.dart';

/// Possible lifecycle statuses for the OSCE form.
enum OsceFormStatus {
  /// Form initialised, ready for input.
  initial,

  /// An existing visit is being loaded into the form.
  editing,

  /// Save operation in progress.
  saving,

  /// Saved successfully.
  saved,

  /// An error occurred (see [OsceFormState.errorMessage]).
  error,
}

/// Immutable state consumed by the UI via `BlocBuilder`.
///
/// Keeps the reactive form data inside the Cubit; the state object only
/// carries lifecycle metadata so the UI knows what to show (spinners, snack
/// bars, etc.).
class OsceFormState extends Equatable {
  const OsceFormState({
    this.status = OsceFormStatus.initial,
    this.visitId,
    this.errorMessage,
  });

  final OsceFormStatus status;

  /// UUID of the visit being edited. Null for a brand-new visit.
  final String? visitId;

  /// Human-readable error message (only set when [status] == [OsceFormStatus.error]).
  final String? errorMessage;

  OsceFormState copyWith({
    OsceFormStatus? status,
    String? visitId,
    String? errorMessage,
  }) {
    return OsceFormState(
      status: status ?? this.status,
      visitId: visitId ?? this.visitId,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, visitId, errorMessage];
}
