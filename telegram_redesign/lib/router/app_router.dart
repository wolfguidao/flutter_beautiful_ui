import 'package:go_router/go_router.dart';
import 'package:telegram_redesign/constant/app_globals.dart';
import 'package:telegram_redesign/entity/session.dart';
import 'package:telegram_redesign/presentation/chats/page/message_page.dart';
import 'package:telegram_redesign/presentation/home/page/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: AppGlobals.navigatorKey,
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => HomePage()),
      GoRoute(
        path: "/message",
        builder: (context, state) {
          final Session session = state.extra as Session;
          return MessagePage(session: session);
        },
      ),
    ],
  );
}
