import 'package:flutter/material.dart';
import 'package:flutter_samples/inherited_widget/provider/app_state.dart';

class AppStateScope extends InheritedWidget {
  const AppStateScope(this.data, {super.key, required super.child});

  final AppState data;

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}
