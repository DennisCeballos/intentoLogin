import 'package:go_router/go_router.dart';
import 'package:form_login/presentation/pages/pages.dart';

final approuter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: LoginUI.name,
      builder: (context, state) => const LoginUI(),
    ),
    GoRoute(
      path: '/register',
      name: RegisterUI.name,
      builder: (context, state) => const RegisterUI(),
    ),
    // Main app
    GoRoute(
      path: '/home/:dni',
      name: HomeUI.name,
      builder: (context, state) => HomeUI(
        dni: state.pathParameters['dni']!
      ),
    )
  ]
);