import 'package:chat_functions_app/screen/account_screen.dart';
import 'package:chat_functions_app/screen/chat_list.dart';
import 'package:chat_functions_app/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(0);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text(
            'DM',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_sharp),
              label: 'account',
            ),
          ],
          currentIndex: selectedIndex.value,
          onTap: (index) => selectedIndex.value = index,
        ),
      ),
    );
  }

  _buildBody(int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        return SettingScreen();
      case 2:
        return AccountScreen();
      default:
        return const ChatList();
    }
  }
}
