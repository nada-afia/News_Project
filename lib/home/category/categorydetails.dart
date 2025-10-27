import 'package:flutter/material.dart';
import 'package:news_project/API/api_manger.dart';
import 'package:news_project/home/category/source_tab_widget.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:news_project/utils/app_colors.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManger.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.gery),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('something went wrong '),
              ElevatedButton(onPressed: () {}, child: Text('Try Again')),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: () {}, child: Text('Try Again')),
            ],
          );
        }
        var sourceList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourcesList: sourceList);
      },
    );
  }
}
