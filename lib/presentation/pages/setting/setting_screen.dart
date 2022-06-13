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
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.mark_email_read_outlined),
                    title: const Text('送信'),
                    value: const Text(''),
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
