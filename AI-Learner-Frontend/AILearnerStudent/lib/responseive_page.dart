import 'package:ailearner/services/AuthGate.dart';
import 'package:ailearner/webpages/web_auth_gate.dart';
import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 650) {
          return const WebAuthGate();
        }
        return const AuthGate();
      },
    ));
  }
}
