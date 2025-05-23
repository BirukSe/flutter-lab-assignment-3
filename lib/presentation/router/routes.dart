import 'package:assignment_flutter/presentation/views/dashboard.dart';
import 'package:assignment_flutter/presentation/views/detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => const DetailPage(),
    ),
  ],
);

