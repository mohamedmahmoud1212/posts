import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/control/news_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(builder: (context, state) {
      final appCubit = context.read<NewsCubit>();
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "News",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: appCubit.news!=null
            ? Column(
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: appCubit.news!.articles!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.black,
                          child: Image.network(
                            appCubit.news!.articles![index].urlToImage.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: appCubit.news!.articles!.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.network(
                              appCubit.news!.articles![index].urlToImage
                                  .toString(),
                            ),
                            title: Text(
                              appCubit.news!.articles![index].title
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                              
                            subtitle: Text(
                              appCubit.news!.articles![index].description
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            // trailing: Container(
                            //     width: 30,
                            //     child: Text(appCubit.news!.articles![index].publishedAt.toString(),style: TextStyle(fontSize: 10,),)),
                          ),
                        );
                      }),
                ),
              ],
            )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
      );
    }, listener: (context, state) {
      final appCubit = context.read<NewsCubit>().news;
    });
  }
}
