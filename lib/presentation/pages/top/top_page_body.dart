import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page.dart';
import 'package:chat_functions_app/providers/top_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPageBody extends ConsumerWidget {
  const TopPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Who...?',
          ),
          const SizedBox(
            height: 80,
          ),
          NormalButton(
            onTap: () {
              ref.read(registerUserProvider.notifier).registerUserData();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
