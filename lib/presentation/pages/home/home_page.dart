import 'package:chat_functions_app/presentation/pages/home/home_page_body.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page_footer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: HomePageBody(),
      bottomNavigationBar: HomePageFooter(),
    );
  }
}
