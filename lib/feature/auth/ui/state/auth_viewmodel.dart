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
    try {
      onSuccess() => context.go(context.namedLocation(HomeView.route));
      showLoadingModal(context);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.mail!,
        password: state.password!,
      );
      closeModal();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      closeModal();
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Failed to register'),
          content: Text(e.message ?? ''),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> signIn(BuildContext context) async {
    try {
      onSuccess() => context.go(context.namedLocation(HomeView.route));
      showLoadingModal(context);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.mail!,
        password: state.password!,
      );
      closeModal();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      closeModal();
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Failed to sign in'),
          content: Text(e.message ?? ''),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

final authViewModelProvider =
    StateNotifierProvider<AuthViewModelNotifier, AuthState>(
  (_) => AuthViewModelNotifier(),
);
