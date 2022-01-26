import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:test_task_25_01/models/photo.dart';
import 'package:test_task_25_01/controllers/photo_controller.dart';

class PhotoCarousel extends StatefulWidget {
  const PhotoCarousel({Key? key}) : super(key: key);

  @override
  _PhotoCarouselState createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends StateMVC {
  late PhotoController _controller;

  _PhotoCarouselState() : super(PhotoController()) {
    _controller = controller as PhotoController;
  }

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPhotoCarousel();
  }

  Widget _buildPhotoCarousel() {
    final state = _controller.currentState;
    if (state is PhotoResultLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is PhotoResultFailure) {
      return Center(
        child: Text(
          state.error,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.red),
        ),
      );
    } else {
      final photoList = (state as PhotoResultSucess).photoList;
      return Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
            ),
              itemCount: photoList.photos.length,
              itemBuilder: (context, index) {
                return Image.network(photoList.photos[index].thumbnailUrl);
              }),
        ),
      );
    }
  }
}
