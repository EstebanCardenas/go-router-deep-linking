part of deep_linking.feature.auth.ui.state;

class AuthState {
  AuthState({
    this.mail,
    this.password,
    this.isRegistering = false,
  });

  final String? mail;
  final String? password;
  final bool isRegistering;

  bool get canSignIn =>
      mail != null && mail != '' && password != null && password != '';

  AuthState copyWith({
    String? mail,
    String? password,
    bool? isRegistering,
  }) =>
      AuthState(
        mail: mail ?? this.mail,
        password: password ?? this.password,
        isRegistering: isRegistering ?? this.isRegistering,
      );
}
