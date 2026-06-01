import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/src/feactures/home/models/user_model.dart';
import 'package:handyman/src/feactures/home/presentation/screens/home_screen.dart';
import 'package:handyman/src/feactures/userDetails/presentation/screens/user_chat_screen.dart';
import 'package:handyman/src/feactures/userDetails/presentation/screens/user_details_screen.dart';

var appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: "home",
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
    GoRoute(
      path: "/user-details",
      name: "userDetails",
      pageBuilder: (context, state) {
        final user = state.extra as UsersModel;
        return MaterialPage(child: UserDetailsScreen(data: user));
      },
    ),
    GoRoute(
      path: "/user-chat",
      name: "userChat",
      pageBuilder: (context, state) {
        final params = state.extra as Map<String, String>;

        return MaterialPage(
          child: UserChatScreen(
            photo: params['photo']!,
            name: params['name']!,
            status: params['status']!,
          ),
        );
      },
    ),
  ],
);
