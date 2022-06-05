import 'package:chat_functions_app/presentation/pages/home/home_page_body.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page_footer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageBody(),
      bottomNavigationBar: HomePageFooter(),
    );
  }
}
