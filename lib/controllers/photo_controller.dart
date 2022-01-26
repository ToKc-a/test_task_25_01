import 'package:test_task_25_01/utils/repository.dart';
import 'package:test_task_25_01/models/photo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PhotoController extends ControllerMVC {
  final RepositoryPhoto repoPhoto = RepositoryPhoto();

  PhotoController();

  PhotoResult currentState = PhotoResultLoading();

  void init() async {
    try {
      final photoList = await repoPhoto.fetchPhotos();
      setState(() => currentState = PhotoResultSucess(photoList));
    } catch (error) {
      setState(
              () => currentState = PhotoResultFailure('Отсутствует подключение'));
    }
  }
}
