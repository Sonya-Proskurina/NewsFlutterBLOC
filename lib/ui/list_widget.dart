import 'package:flutter/material.dart';
import 'package:flutter_t/bloc/news_state.dart';

import 'list_item_widget.dart';

class ListWidget extends StatelessWidget {
  NewsLoadedState state;

  ListWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.loadedNews.length,
      itemBuilder: (context, index) =>
          ListItemWidget(state: state, index: index),
    );
  }
}
