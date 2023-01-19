part of deep_linking.core.models;

class AppPage {
  AppPage._();

  static Page create({
    required Widget child,
    LocalKey? key,
  }) {
    if (Platform.isAndroid) {
      return AndroidPage(key: key, child: child);
    } else {
      return CupertinoPage(key: key, child: child);
    }
  }
}

class AndroidPage extends CustomTransitionPage {
  AndroidPage({
    required super.child,
    super.key,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.ease),
              ),
              child: child,
            );
          },
        );
}
