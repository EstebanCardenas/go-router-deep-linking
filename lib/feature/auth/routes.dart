part of deep_linking.feature.auth;

final authRoutes = [
  GoRoute(
    path: '/auth',
    name: SignInView.route,
    pageBuilder: (context, state) => AppPage.create(
      key: state.pageKey,
      child: const SignInView(),
    ),
  ),
];
