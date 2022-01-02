import 'package:flutter/material.dart';
import 'package:flutter_t/bloc/news_state.dart';

class ListItemWidget extends StatelessWidget {
  NewsLoadedState state;
  int index;
  ListItemWidget({Key? key, required this.state, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 8,left: 8,bottom: 4, top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(state.loadedNews[index].title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),
              ),
              const SizedBox(height: 8,),
              Text(state.loadedNews[index].body,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ]
        )
    );
  }
}