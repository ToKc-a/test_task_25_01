import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:test_task_25_01/appBar.dart';
import 'package:test_task_25_01/post.dart';
import 'package:test_task_25_01/post_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC {

  late PostController _controller;

  _HomeScreenState():super(PostController()){
    _controller = controller as PostController;
  }

  @override
  void initState(){
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Главная страница', context),
      body: _buildContent()
    );
  }

  Widget _buildContent(){
    final state = _controller.currentState;
    if (state is PostResultLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is PostResultFailure){
      return Center(
        child: Text(
          state.error, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.red),
        ),
      );
    } else {
      final posts = (state as PostResultSucess).postList.posts;
      return Padding(padding: EdgeInsets.all(10), child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return _buildPostItem(posts[index]);
          },
      ),
      );
    }
  }

  Widget _buildPostItem (Post post){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.3)
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Theme.of(context).primaryColor
            ),
            padding: EdgeInsets.all(10),
            child: Text(post.title, textAlign: TextAlign.left, style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),),
          ),
          Container(
            child: Text(post.body, style: Theme.of(context).textTheme.bodyText2,
            ),
            padding: EdgeInsets.all(10),
          )
        ],
      ),
    );
  }
}

