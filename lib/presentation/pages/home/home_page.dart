import 'package:chat_functions_app/presentation/pages/home/home_page_body.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(),
      bottomNavigationBar: HomePageFooter(),
    );
  }
}
