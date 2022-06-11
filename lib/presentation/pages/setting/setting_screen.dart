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
                title: Text('ユーザー情報'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.account_box_outlined),
                    title: Text('プロフィール'),
                    value: Text('編集'),
                  ),
                ],
              ),
              SettingsSection(
                title: Text('チャット依頼'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: Icon(Icons.mark_email_unread_outlined),
                    title: Text('受信'),
                    value: Text(''),
                  ),
                  SettingsTile.navigation(
                    leading: Icon(Icons.mark_email_read_outlined),
                    title: Text('送信'),
                    value: Text(''),
                  ),
                ],
              ),
              SettingsSection(
                title: Text('設定'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: Icon(Icons.info_outline),
                    title: Text('お知らせ'),
                    value: Text(''),
                  ),
                  SettingsTile.switchTile(
                    onToggle: (value) {},
                    initialValue: true,
                    leading: Icon(Icons.notifications_outlined),
                    title: Text('通知'),
                  ),
                ],
              ),
              SettingsSection(
                title: Text('バージョン'),
                tiles: <SettingsTile>[
                  SettingsTile(
                    enabled: false,
                    leading: Icon(Icons.handyman),
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
