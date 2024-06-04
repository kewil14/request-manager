import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:request_manager/features/auth/forgot_pass_view.dart';
import 'package:request_manager/features/auth/login_view.dart';
import 'package:request_manager/features/auth/register_view.dart';
import 'package:request_manager/features/auth/reset_pass_view.dart';
import 'package:request_manager/features/home/home_view.dart';
import 'package:request_manager/features/profile/profile_view.dart';
import 'package:request_manager/features/request/add_request_view.dart';
import 'package:request_manager/features/request/detail_request_view.dart';
import 'package:request_manager/features/request/list_request_view.dart';
import 'package:request_manager/features/ressource/add_ressource_view.dart';
import 'package:request_manager/features/ressource/detail_ressource_view.dart';
import 'package:request_manager/features/ressource/list_ressource_view.dart';
import 'package:request_manager/routes/main_menu.dart';
import 'package:request_manager/routes/name_route.dart';

class AppNavigation {
  AppNavigation._();

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shell Home');
  static final _shellNavigatorProfiles =
      GlobalKey<NavigatorState>(debugLabel: 'shell Profiles');
  static final _shellNavigatorRequest =
      GlobalKey<NavigatorState>(debugLabel: 'shell Request');
  static final _shellNavigatorRessource =
      GlobalKey<NavigatorState>(debugLabel: 'shell Ressource');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: "/" + AppRoutes.home,
    // initialLocation:
    //     "/" + AppRoutes.main_home + "/" + AppRoutes.list_ressources,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainMenuWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/${AppRoutes.home}",
                name: AppRoutes.home,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeScreen(),
                routes: const [
                  // GoRoute(
                  //   path: 'subHome',
                  //   name: 'subHome',
                  //   pageBuilder: (context, state) => CustomTransitionPage<void>(
                  //     key: state.pageKey,
                  //     child: const SubHomeView(),
                  //     transitionsBuilder:
                  //         (context, animation, secondaryAnimation, child) =>
                  //             FadeTransition(opacity: animation, child: child),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorRequest,
            routes: <RouteBase>[
              GoRoute(
                path: "/${AppRoutes.request}",
                name: AppRoutes.request,
                builder: (BuildContext context, GoRouterState state) =>
                    const ListRequestScreen(),
                routes: const [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorRessource,
            routes: <RouteBase>[
              GoRoute(
                path: "/${AppRoutes.ressource}",
                name: AppRoutes.ressource,
                builder: (BuildContext context, GoRouterState state) =>
                    const ListRessourceScreen(),
                routes: const [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfiles,
            routes: <RouteBase>[
              GoRoute(
                path: "/${AppRoutes.profile}",
                name: AppRoutes.profile,
                builder: (BuildContext context, GoRouterState state) =>
                    const ProfileScreen(),
                routes: const [],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.login,
        parentNavigatorKey: _rootNavigatorKey,
        path: "/${AppRoutes.login}",
        builder: (BuildContext context, GoRouterState state) => LoginScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: AppRoutes.register,
        parentNavigatorKey: _rootNavigatorKey,
        path: "/${AppRoutes.register}",
        builder: (BuildContext context, GoRouterState state) => RegisterScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: AppRoutes.forgot_password,
        parentNavigatorKey: _rootNavigatorKey,
        path: "/${AppRoutes.forgot_password}",
        builder: (BuildContext context, GoRouterState state) =>
            ForgotPasswordScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: AppRoutes.reset_password,
        parentNavigatorKey: _rootNavigatorKey,
        path: "/${AppRoutes.reset_password}",
        builder: (BuildContext context, GoRouterState state) =>
            ResetPasswordScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: AppRoutes.add_request,
        parentNavigatorKey: _rootNavigatorKey,
        path: "/${AppRoutes.add_request}",
        builder: (BuildContext context, GoRouterState state) =>
            AddRequestScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: AppRoutes.add_ressource,
        parentNavigatorKey: _rootNavigatorKey,
        path: "/${AppRoutes.add_ressource}",
        builder: (BuildContext context, GoRouterState state) =>
            AddRessourceScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
          name: AppRoutes.detail_request,
          parentNavigatorKey: _rootNavigatorKey,
          path: "/${AppRoutes.detail_request}",
          builder: (BuildContext context, GoRouterState state) {
            // JobServiceModel currentJobCategory = state.extra as JobServiceModel;

            return DetailRequestScreen(
              key: state.pageKey,
            );
          }),
      GoRoute(
        name: AppRoutes.detail_ressource,
        parentNavigatorKey: _rootNavigatorKey,
        path: "/${AppRoutes.detail_ressource}",
        builder: (BuildContext context, GoRouterState state) {
          // JobServiceModel currentJobCategory = state.extra as JobServiceModel;
          return DetailRessourceScreen(
            key: state.pageKey,
          );
        },
      ),
    ],
  );
}
