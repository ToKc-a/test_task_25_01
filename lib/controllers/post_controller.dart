import 'package:test_task_25_01/utils/repository.dart';
import 'package:test_task_25_01/models/post.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PostController extends ControllerMVC {
  final RepositoryPost repo = RepositoryPost();

  PostController();

  PostResult currentState = PostResultLoading();

  void init() async {
    try {
      final postList = await repo.fetchPosts();
      setState(() => currentState = PostResultSucess(postList));
    } catch (error) {
      setState(
          () => currentState = PostResultFailure('Отсутствует подключение'));
    }
  }
}
