import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sossa_page/main.dart';

void main() {
  testWidgets('App arranca y muestra la pantalla de Login',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SossaPageApp(initialRoute: '/login'));
    await tester.pumpAndSettle();

    expect(find.text('SOSSA_PAGE'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
    expect(find.text('Crear cuenta'), findsOneWidget);
  });
}
