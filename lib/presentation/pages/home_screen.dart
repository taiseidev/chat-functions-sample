import 'package:chat_functions_app/presentation/pages/chat_list.dart';
import 'package:chat_functions_app/presentation/pages/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(0);
    return Scaffold(
      body: _buildBody(selectedIndex.value),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: selectedIndex.value,
        onTap: (index) => selectedIndex.value = index,
      ),
    );
  }

  _buildBody(int selectedIndex) {
    if (selectedIndex == 1) {
      return SettingScreen();
    }
    return ChatList();
  }
}
