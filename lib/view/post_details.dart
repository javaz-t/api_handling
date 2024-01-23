import 'package:api_handing/api/model/post_model.dart';
import 'package:api_handing/controller/post_services.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatefulWidget {
  final PostModel? post;
  PostDetailsPage({super.key, this.post});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text("Post Details"),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 1,
            color: Colors.cyan,
          ),
          Text(
            '${widget.post!.title}',
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 1,
            color: Colors.cyan,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${widget.post!.body}',
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 1,
            color: Colors.cyan,
          ),
          Text('Comments'),
          Expanded(
              child: FutureBuilder(
            future: _postService.getComments(widget.post!.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final comment = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          title: Text('${comment.name}'),
                          subtitle: Text('${comment.body}'),
                        ),
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ))
        ],
      ),
    );
  }
}
