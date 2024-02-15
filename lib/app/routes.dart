import 'package:contact_app/view/contact_detail_view.dart';
import 'package:contact_app/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'contact_detail',
          builder: (BuildContext context, GoRouterState state) {
            return ContactDetailView();
          },
        ),
      ],
    ),
  ],
);
