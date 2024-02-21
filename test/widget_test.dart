// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_quiz/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Answer all questions correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    await tester.answerQuestion(
      "What is Flutter?",
      "UI framework",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What platforms are supported by Flutter?",
      "Desktop, web and mobile",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "Does Flutter render its UI in a WebView?",
      "No",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What programming language are Flutter apps primarily written in?",
      "Dart",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What is the widget tree in Flutter?",
      "The hierarchy of UI elements in a Flutter app",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What is the purpose of the setState method in Flutter?",
      "To update the UI based on changes in the app's state",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What is the BuildContext used for?",
      "Provides information about the widget hierarchy",
    );
    await tester.tapDone();
    // await tester.next();

    expect(find.text("Hurray 🥳, you are a true expert!"), findsOneWidget);
  });

  testWidgets('Answer a single question incorrectly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    await tester.answerQuestion(
      "What is Flutter?",
      "Insect",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What platforms are supported by Flutter?",
      "Desktop, web and mobile",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "Does Flutter render its UI in a WebView?",
      "No",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What programming language are Flutter apps primarily written in?",
      "Dart",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What is the widget tree in Flutter?",
      "The hierarchy of UI elements in a Flutter app",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What is the purpose of the setState method in Flutter?",
      "To update the UI based on changes in the app's state",
    );
    await tester.tapNext();

    await tester.answerQuestion(
      "What is the BuildContext used for?",
      "Provides information about the widget hierarchy",
    );
    await tester.tapDone();
    // await tester.next();

    expect(find.text("😥 you can do better!"), findsOneWidget);
  });
}

extension WidgetTesterX on WidgetTester {
  Future<void> answerQuestion(String question, String answer) async {
    // Make sure first question is visible
    expect(find.text(question), findsOneWidget);

    // Select the correct answer
    await tap(find.text(answer));
    await pumpAndSettle();
  }

  Future<void> tapNext() async {
    await tap(find.text("Next"));
    await pumpAndSettle();
  }

  Future<void> tapDone() async {
    await tap(find.text("Done"));
    await pumpAndSettle();
  }
}
