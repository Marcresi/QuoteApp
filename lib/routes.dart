import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quoteApp/errorpage.dart';
import 'package:quoteApp/screens/author.dart';
import 'package:quoteApp/screens/fav.dart';
import 'package:quoteApp/screens/homepage.dart';
import 'package:quoteApp/screens/search.dart';


final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => HomePage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'Author',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              MaterialPage(
            child: Author(),
          ),
        ),
        GoRoute(
          path: 'Search',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              MaterialPage(
            child: SearchFul(),
          ),
        ),
        GoRoute(
          path: 'Fav',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              MaterialPage(
            child: Fav(),
          ),
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: ErrorPage(exception: state.error),
  ),
);
