import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gully_cricket/screens/tabs.dart';

void main() {
  runApp(const ProviderScope(
    child: MaterialApp(debugShowCheckedModeBanner: false, home: Tabs()),
  ));
}
