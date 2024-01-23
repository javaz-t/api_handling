import 'package:api_handing/controller/post_services.dart';
import 'package:api_handing/view/post_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text('posts'),
            Expanded(
                child: FutureBuilder(
              future: _postService.getAllPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data![index];
                        return Card(
                          color: Colors.orange,
                          child: ListTile(
                            onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetailsPage(post: post,)));}
                            ,title: Text('${post.title}'),
                            subtitle: Text(
                              "${post.body}",
                              overflow: TextOverflow.ellipsis,
                            ),
                            leading: CircleAvatar(
                              child: Text("${index + 1}"),
                            ),
                          ),
                        );
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )),
          ],
        ));
  }
}
