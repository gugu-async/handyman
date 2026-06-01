import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handyman/src/core/router/app_router.dart';
import 'package:handyman/src/core/theme/app_theme.dart';
import 'package:handyman/src/feactures/home/state/theme_provider.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    var isDarkModeValue = ref.watch(isDarkModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: isDarkModeValue ? AppTheme.dark : AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
