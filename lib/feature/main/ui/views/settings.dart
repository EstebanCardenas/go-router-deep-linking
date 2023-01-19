part of deep_linking.feature.main.ui.views;

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const String route = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Settings View'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Setting'),
                  content: const Text('Setting description'),
                  actions: [
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
              child: const Text('Display dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
