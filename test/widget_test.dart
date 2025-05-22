import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tentando/main.dart';
 
void main() {
  testWidgets('Tela principal da pizzaria carrega corretamente', (WidgetTester tester) async {
    // Constrói o app
    await tester.pumpWidget(const PizzaApp());
 
    // Verifica se o título está presente
    expect(find.text('🍕 Pizzaria Moderna'), findsOneWidget);
 
    // Verifica se a pizza Margherita aparece
    expect(find.text('Margherita'), findsOneWidget);
 
    // Localiza o botão "Pedir" e toca
    final pedirButton = find.widgetWithText(ElevatedButton, 'Pedir').first;
    await tester.tap(pedirButton);
 
    // Avança o frame para exibir o SnackBar
    await tester.pump();
 
    // Verifica se aparece a mensagem de SnackBar
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Você adicionou Margherita ao pedido!'), findsOneWidget);
  });
}
 