part of deep_linking.feature.main.ui.views;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        actions: [
          IconButton(
            onPressed: () => context.go(
              context.namedLocation(SettingsView.route),
            ),
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Home View'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(
                context.namedLocation(DetailView.route),
              ),
              child: const Text('Go to Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
