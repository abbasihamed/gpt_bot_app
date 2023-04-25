import 'package:flutter/material.dart';

const String apiKey = '';
const String baseUrl = 'https://api.openai.com/v1';
const String secretKey = 'secretKey';
const String themeKey = 'theme';

DateTime dateTime = DateTime.now();

GlobalKey<ScaffoldMessengerState> snackBar =
    GlobalKey<ScaffoldMessengerState>();
