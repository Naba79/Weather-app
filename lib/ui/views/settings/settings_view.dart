import 'package:flutter/material.dart';
import '../../../main.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: dark,
              onChanged: (v) => MainApp.of(context)?.changeTheme(v),
            ),
          ],
        ),
      ),
    );
  }
}