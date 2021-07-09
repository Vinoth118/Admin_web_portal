import 'package:admin_web_portal/components/side_menu.dart';
import 'package:admin_web_portal/main.dart';
import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget MakeTestableWidget ({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('Roles tap color Changes', (WidgetTester tester) async {
    var listTile = find.text('Roles');

    await tester.pumpWidget(MakeTestableWidget(child: SideMenu()));
    await tester.pump();
    expect(listTile,findsOneWidget);

    
  });
}