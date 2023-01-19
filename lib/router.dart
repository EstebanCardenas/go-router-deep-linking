import 'package:flutter_deep_linking/feature/auth/auth.dart';
import 'package:flutter_deep_linking/feature/main/main.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/auth',
  routes: [
    ...authRoutes,
    ...mainRoutes,
  ],
);
