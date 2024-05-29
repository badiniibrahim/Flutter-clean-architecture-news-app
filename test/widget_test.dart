// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/domain/usecases/fetch_headline_use_case.dart';
import 'package:news_app/domain/usecases/fetch_news_use_case.dart';
import 'package:news_app/domain/usecases/signup_use_case.dart';
import 'package:tuple/tuple.dart';

import 'repositories/mock_article_repository.dart';
import 'repositories/mock_auth_repository.dart';

void main() {
  test("Sign up test", () async {
    //Mock input
    const registerUserName = "test username";
    //Mock data
    final signUpUseCase = SignUpUseCase(MockAuthenticationRepository());
    final user = await signUpUseCase.execute(registerUserName);
    expect(user.username, registerUserName);
  });

  test("Fetch headline test ", () async {
    const pageSize = 20;
    const currentPage = 1;

    //Mock data
    final fetchHeadlineUseCase = FetchHeadlineUseCase(MockArticleRepository());
    final paging =
        await fetchHeadlineUseCase.execute(const Tuple2(currentPage, pageSize));

    // Verify that data has created.
    expect(paging.articles.length, 20);
  });

  test('Fetch news test', () async {
    //Mock input
    const keyword = "bitcoin";
    const pageSize = 20;
    const currentPage = 1;

    //Mock data
    final fetchHeadlineUseCase = FetchNewsUseCase(MockArticleRepository());
    final paging = await fetchHeadlineUseCase
        .execute(const Tuple3(keyword, currentPage, pageSize));

    // Verify that data has created.
    expect(paging.articles.length, 3);
  });
}
