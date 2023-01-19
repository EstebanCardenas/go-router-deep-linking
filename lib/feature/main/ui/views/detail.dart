part of deep_linking.feature.main.ui.views;

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  static const String route = 'detail';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Detail View'),
      ),
    );
  }
}
