import 'package:flutter/material.dart';
// import 'screens/ocr_page.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OCR App',
      initialRoute: AppRoutes.ocr,
      routes: AppRoutes.routes,
    );
  }
}
