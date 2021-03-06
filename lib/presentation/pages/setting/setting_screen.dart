import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/components/normal_dialog.dart';
import 'package:chat_functions_app/presentation/pages/chat_notification/chat_notification_page.dart';
import 'package:chat_functions_app/presentation/pages/top/top_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SettingsList(
            physics: const NeverScrollableScrollPhysics(),
            sections: [
              SettingsSection(
                title: const Text('ユーザー情報'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.account_box_outlined),
                    title: const Text('プロフィール'),
                    value: const Text('編集'),
                  ),
                ],
              ),
              SettingsSection(
                title: const Text('チャット依頼'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.mark_email_unread_outlined),
                    title: const Text('受信'),
                    value: const Text(''),
                    onPressed: (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        // analyticsに送信
                        settings: const RouteSettings(name: '受信一覧画面へ遷移'),
                        builder: (context) => ChatNotificationPage(0),
                      ),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.mark_email_read_outlined),
                    title: const Text('送信'),
                    value: const Text(''),
                    onPressed: (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        // analyticsに送信
                        settings: const RouteSettings(name: '送信一覧画面へ遷移'),
                        builder: (context) => ChatNotificationPage(1),
                      ),
                    ),
                  ),
                ],
              ),
              SettingsSection(
                title: const Text('設定'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('お知らせ'),
                    value: const Text(''),
                  ),
                  SettingsTile.switchTile(
                    onToggle: (value) {},
                    initialValue: true,
                    leading: const Icon(Icons.notifications_outlined),
                    title: const Text('通知'),
                  ),
                ],
              ),
              SettingsSection(
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('ログアウト'),
                    onPressed: (value) async {
                      await showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return NormalDialog(
                            title: 'ログアウトしますか？',
                            content: 'ログアウトしてもデータは削除されません。',
                            actions: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                NormalButton(
                                  title: 'ログアウト',
                                  onTap: () async {
                                    final auth = FirebaseAuth.instance;
                                    await auth.signOut();
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => const TopPage()),
                                      ),
                                      (_) => false,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                NormalButton(
                                  title: '閉じる',
                                  onTap: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: const Text('バージョン'),
                tiles: <SettingsTile>[
                  SettingsTile(
                    enabled: false,
                    leading: const Icon(Icons.handyman),
                    title: const Text('1.0.0'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
