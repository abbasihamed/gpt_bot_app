import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:talk_with_bot/utils/const.dart';

class InternetConnection {
  Future checker() async {
    InternetConnectionChecker().onStatusChange.listen((event) {
      if (event == InternetConnectionStatus.connected) {
        snackBar.currentState!.showSnackBar(
            const SnackBar(content: Text('Network is coneccted')));
      }
      if (event == InternetConnectionStatus.disconnected) {
        snackBar.currentState!.showSnackBar(
          SnackBar(
            content: const Text('Network is disconnected'),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () {},
            ),
          ),
        );
      }
    });
  }
}
