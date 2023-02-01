part of deep_linking.feature.auth;

final authRoutes = [
  GoRoute(
    path: '/auth',
    name: SignInView.route,
    pageBuilder: (context, state) => AppPage.create(
      key: state.pageKey,
      child: const SignInView(),
    ),
    redirect: (context, state) async {
      if (FirebaseAuth.instance.currentUser != null) {
        PendingDynamicLinkData? initialLink =
            await FirebaseDynamicLinks.instance.getInitialLink();
        return initialLink?.link.path ?? '/';
      }
      return null;
    },
  ),
];
