import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:test_task_25_01/utils/appBar.dart';
import 'package:test_task_25_01/utils/photo_carousel.dart';
import 'package:test_task_25_01/models/user.dart';
import 'package:test_task_25_01/controllers/user_controller.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends StateMVC {
  late UserController _controller;

  _UserScreenState() : super(UserController()) {
    _controller = controller as UserController;
  }

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('Пользователь', context),
        body: _buildContent());
  }

  Widget _buildContent() {
    final state = _controller.currentState;
    if (state is UserResultLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is UserResultFailure) {
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
      final user = (state as UserResultSucess).user;
      return Padding(padding: EdgeInsets.all(10), child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Детальная информация:'),
            SizedBox(
              height: 10,
            ),
            Text('Имя: ${user.name}'),
            Text('Имя пользователя: ${user.username}'),
            Text('Электронная почта: ${user.email}'),
            Text('Телефон: ${user.phone}'),
            Text('Сайт: ${user.website}'),
            Text('Адрес: ${user.address.getAddress()}'),
            Text('Компания: ${user.company.getCompany()}'),
            SizedBox(height: 40,),
            PhotoCarousel()
          ],
        ),
      ),);
    }
  }
}
