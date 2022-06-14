import 'package:firebase_analytics/firebase_analytics.dart';

// アナリティクスイベント
enum AnalyticsEvent {
  Button,
}

// 送りたいイベントがあったらこのクラスに列挙していく
// アナリティクス
class AnalyticsService {
  static final analytics = FirebaseAnalytics.instance;
  static final observer = FirebaseAnalyticsObserver(analytics: analytics);

  // ボタンタップイベント送信
  Future<void> sendButtonEvent({required String buttonName}) async {
    sendEvent(
      event: AnalyticsEvent.Button,
      parameterMap: {'buttonName': buttonName},
    );
  }

  // イベントを送信する
  /// [event] AnalyticsEvent
  /// [parameterMap] パラメータMap
  Future<void> sendEvent({
    required AnalyticsEvent event,
    required Map<String, dynamic> parameterMap,
  }) async {
    // Enumクラス名.列挙IDの列挙IDのみを取得している。
    final eventName = event.toString().split('.')[1];
    analytics.logEvent(
      name: eventName,
      parameters: parameterMap,
    );
  }
}
