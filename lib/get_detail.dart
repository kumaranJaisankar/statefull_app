import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:statefull_app/Constants/apis/get_api.dart';
import 'package:statefull_app/model/blog_model.dart';
import 'package:statefull_app/model/my_models.dart';

class GetMethod extends StatefulWidget {
  const GetMethod({super.key});

  @override
  State<GetMethod> createState() => _GetMethodState();
}

class _GetMethodState extends State<GetMethod> {
  Future<List<BlogDataModel>>? blogListCollection;

  BlogApi blogGetApi = BlogApi();

  Future refresh() async {
    print(blogGetApi.getAllBlogList());
    await Future.delayed(Duration(seconds: 2), fetchBlogData);
  }

  @override
  void initState() {
    fetchBlogData();
    super.initState();
  }

  void fetchBlogData() {
    setState(() {
      blogListCollection = blogGetApi.getAllBlogList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Method'),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: FutureBuilder<List<BlogDataModel>>(
            future: blogListCollection,
            builder: (context, snapshot) {
              // print(snapshot.data!.map((e) => e.toJson()).toList());
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        selected: true,
                        tileColor: Colors.blue,
                        onTap: () {},
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(snapshot.data![index].text),
                        leading: Text('data'),
                        trailing: Text(snapshot.data![index].textBy),
                      );
                    });
              } else {
                return Center(
                  child: Text('no data found'),
                );
              }
            },
          ),
        ));
  }
}
