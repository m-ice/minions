import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Foreground Service Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel("my_foreground_service");

  Future<void> _startService() async {
    try {
      await platform.invokeMethod("startService");
    } on PlatformException catch (e) {
      debugPrint("Failed to start service: ${e.message}");
    }
  }

  Future<void> _stopService() async {
    try {
      await platform.invokeMethod("stopService");
    } on PlatformException catch (e) {
      debugPrint("Failed to stop service: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("前台服务保活示例")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _startService,
              child: const Text("启动前台服务"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _stopService,
              child: const Text("停止前台服务"),
            ),
          ],
        ),
      ),
    );
  }
}