import 'package:flutter/material.dart';
import '../widgets/utils/action_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        ActionBarWidget(),
        Container(
          height: 200,
          child: PageView.builder(
            itemCount: 10,
            controller: PageController(viewportFraction: 0.8),
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            itemBuilder: (context, position) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.redAccent,
                width: 100,
              );
            }
          ),
        )
      ],
    ));
  }
}
