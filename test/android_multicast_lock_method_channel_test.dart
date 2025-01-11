import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_multicast_lock/android_multicast_lock_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAndroidMulticastLock platform = MethodChannelAndroidMulticastLock();
  const MethodChannel channel = MethodChannel('android_multicast_lock');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}