part of 'bio_auth_cubit.dart';

@immutable
abstract class BioAuthState {}

class BioAuthInitial extends BioAuthState {}

class BioAuthWaitingState extends BioAuthState {}

class BioNotAvailableState extends BioAuthState {
  final String message;
  BioNotAvailableState({required this.message});
}

class BioNotExistingState extends BioAuthState {
  final String message;
  BioNotExistingState({required this.message});
}

class BioNotAuthenticatedState extends BioAuthState {
  final String message;
  BioNotAuthenticatedState({required this.message});
}

class BioAuthenticatedState extends BioAuthState {}
