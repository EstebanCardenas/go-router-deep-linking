part of deep_linking.feature.auth.ui.views;

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  static const String route = 'sign-in';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthState state = ref.watch(authViewModelProvider);
    AuthViewModelNotifier viewModel = ref.watch(authViewModelProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: true,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s'))
              ],
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
              onChanged: viewModel.onEmailChagned,
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              enableSuggestions: true,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s'))
              ],
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
              onChanged: viewModel.onPassChagned,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: state.canSignIn
                  ? () => viewModel.authenticate(context)
                  : null,
              child: Text(state.isRegistering ? 'Register' : 'Sign In'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Or'),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: viewModel.toggleRegistering,
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    state.isRegistering ? 'Sign In' : 'Register',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
