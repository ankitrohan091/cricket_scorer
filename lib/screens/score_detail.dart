import 'package:flutter/material.dart';
import 'package:gully_cricket/card.dart';

class ScoreDetail extends StatefulWidget {
  final String appBarTitle;
  const ScoreDetail({required this.appBarTitle,super.key});

  @override
  State<ScoreDetail> createState() => _ScoreDetailState();
}

class _ScoreDetailState extends State<ScoreDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text('Are you sure want to Go Back.'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Back'))
                    ],
                  );
                });
          },
        ),
      ),
      body: const Column(
        children: [
          ScoreWidget(),
          SizedBox(height: 6,),
          BatsmanCard(),
          SizedBox(height: 6),
          BowlerCard(),
          SizedBox(height: 6),
          ThisOver(),
        ],
      ),
      );
  }
}