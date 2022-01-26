import 'package:test_task_25_01/repository.dart';
import 'package:test_task_25_01/user.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class UserController extends ControllerMVC {
  final RepositoryUser repoUser = RepositoryUser();

  UserController();

  UserResult currentState = UserResultLoading();

  void init() async {
    try {
      final user = await repoUser.fetchUser();
      setState(() => currentState = UserResultSucess(user));
    } catch (error) {
      setState(
          () => currentState = UserResultFailure('Отсутствует подключение'));
    }
  }
}
