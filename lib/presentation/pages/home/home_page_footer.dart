import 'package:chat_functions_app/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageFooter extends ConsumerWidget {
  const HomePageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeBottomNavigationIndexProvider);
    return BottomNavigationBar(
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
      currentIndex: selectedIndex,
      onTap: (index) => ref
          .read(homeBottomNavigationIndexProvider.notifier)
          .update((state) => state = index),
    );
  }
}
