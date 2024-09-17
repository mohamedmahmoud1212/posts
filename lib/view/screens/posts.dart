import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/control/news_cubit.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        builder: (context, state) {
          final appCubit = context.read<NewsCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text('Posts'),
            ),
            body: state is PostsReach
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: appCubit.posts!.articles!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Card(
                                    elevation: 3,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Row(
                                              children: [
                                                Container(
                                                   clipBehavior: Clip.antiAliasWithSaveLayer,
                                                  width: 55,
                                                  height: 48,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
                                                  child: Image.network(
                                                    appCubit
                                                        .posts!
                                                        .articles![index]
                                                        .urlToImage
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const  EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                Container(
                                                    width: 250,
                                                    child: Text(appCubit.posts!
                                                        .articles![index].title
                                                        .toString())),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 250,
                                                  child: Text(
                                                    appCubit
                                                        .posts!
                                                        .articles![index]
                                                        .description
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 350,
                                            child: Image.network(appCubit.posts!
                                                .articles![index].urlToImage
                                                .toString()),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30, left: 30),
                                            child: Container(
                                              height: 50,
                                              width: 350,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(

                                                      child: Icon(
                                                          Icons.waving_hand)),
                                                  InkWell(
                                                    highlightColor: Colors.red,
                                                    child: Icon(Icons.comment),
                                                    focusColor: Colors.red,
                                                  ),
                                                  InkWell(
                                                      child: Icon(Icons.share))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
          );
        },
        listener: (context, state) {});
  }
}
