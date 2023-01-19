part of deep_linking.feature.auth.ui.state;

class AuthViewModelNotifier extends StateNotifier<AuthState>
    with LoadingDisplayer {
  AuthViewModelNotifier() : super(AuthState());

  void onEmailChagned(String value) => state = state.copyWith(
        mail: value,
      );
  void onPassChagned(String value) => state = state.copyWith(
        password: value,
      );

  void toggleRegistering() => state = state.copyWith(
        isRegistering: !state.isRegistering,
      );

  Future<void> authenticate(BuildContext context) async {
    if (state.isRegistering) {
      await register(context);
    } else {
      await signIn(context);
    }
  }

  Future<void> register(BuildContext context) async {
    showLoadingModal(context);
    await Future.delayed(const Duration(seconds: 1));
    closeModal();
  }

  Future<void> signIn(BuildContext context) async {
    showLoadingModal(context);
    await Future.delayed(const Duration(seconds: 1));
    closeModal();
  }
}

final authViewModelProvider =
    StateNotifierProvider<AuthViewModelNotifier, AuthState>(
  (_) => AuthViewModelNotifier(),
);
