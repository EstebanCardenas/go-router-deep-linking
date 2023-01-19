part of deep_linking.feature.main;

final List<GoRoute> mainRoutes = [
  GoRoute(
    path: HomeView.route,
    name: HomeView.route,
    pageBuilder: (context, state) => AppPage.create(
      key: state.pageKey,
      child: const HomeView(),
    ),
    routes: [
      GoRoute(
        path: DetailView.route,
        name: DetailView.route,
        pageBuilder: (context, state) => AppPage.create(
          key: state.pageKey,
          child: const DetailView(),
        ),
      ),
      GoRoute(
        path: SettingsView.route,
        name: SettingsView.route,
        pageBuilder: (context, state) => AppPage.create(
          key: state.pageKey,
          child: const SettingsView(),
        ),
      ),
    ],
  ),
];
