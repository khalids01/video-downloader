import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_downloader/src/constants/routes.dart';
import 'package:video_downloader/src/pages/home.dart';
// import 'package:safescan_0/src/pages/recognizer.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: Endpoints.home,
      routes: [
        GoRoute(
          path: Endpoints.home,
          name: Endpoints.names[Endpoints.home],
          builder: (context, state) => Home(
            key: state.pageKey,
          ),
        ),
      ],
    );
  },
);