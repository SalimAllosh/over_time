import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';
import 'package:over_time/Core/Messages/messages.dart';

part 'bio_auth_state.dart';

class BioAuthCubit extends Cubit<BioAuthState> {
  BioAuthCubit() : super(BioAuthInitial());

  final LocalAuthentication auth = LocalAuthentication();

  Future<void> authFun() async {
    emit(BioAuthWaitingState());
    try {
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();

      if (!canAuthenticate) {
        emit(BioNotAvailableState(message: BIO_NOT_AVAILABLE_MESSAGE));
      }
    } catch (e) {}

    try {
      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      if (!availableBiometrics.isNotEmpty) {
        emit(BioNotExistingState(message: BIO_NOT_EXSIT_MESSAGE));
      }
    } catch (e) {}

    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: BIO_CHECK_MESSAGE,
          options: const AuthenticationOptions());
      if (didAuthenticate) {
        emit(BioAuthenticatedState());
      }
    } catch (e) {}
  }
}
