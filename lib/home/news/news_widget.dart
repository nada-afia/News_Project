import 'package:flutter/material.dart';
import 'package:news_project/API/api_manger.dart';
import 'package:news_project/home/news/news_item.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:news_project/model/newsResponse.dart';

import '../../utils/App_colors.dart';

class NewsWidget extends StatelessWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return FutureBuilder<NewsResponse>(
      future: ApiManger.getNewsSource(source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.gery),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'something went wrong ',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.status ?? 'Something went wrong'),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        var newList = snapshot.data?.articles ?? [];
        return ListView.separated(
          padding: EdgeInsets.only(top: height * 0.02),
          itemBuilder: (context, index) {
            return NewsItem(news: newList[index]);
          },
          itemCount: newList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: height * 0.02,);
          },
        );
      },
    );
  }
}
