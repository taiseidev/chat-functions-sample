import 'package:chat_functions_app/presentation/pages/chat/chat_page.dart';
import 'package:chat_functions_app/presentation/pages/setting/setting_screen.dart';
import 'package:chat_functions_app/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeBottomNavigationIndexProvider);
    if (selectedIndex == 1) {
      return SettingScreen();
    }
    return ChatPage();
  }
}
