import 'package:flutter/material.dart';
import 'package:gully_cricket/models/record_card.dart';

class Record extends StatelessWidget {
  final String name;
  const Record({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                pinned: true,
                expandedHeight: 300,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text(
                  name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                flexibleSpace: const FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Image(
                    image: AssetImage('assets/Player_logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      text: 'Batting',
                    ),
                    Tab(
                      text: 'Bowling',
                    ),
                    Tab(
                      text: 'Fielding',
                    )
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: const [
                  RecordCard(title: 'Matches', number: '1'),
                  RecordCard(title: 'Innings', number: '0'),
                  RecordCard(title: 'Runs', number: '0'),
                  RecordCard(title: 'Not Outs', number: '1'),
                  RecordCard(title: 'Best Score', number: '0'),
                  RecordCard(title: 'Strike Rate', number: '0.00'),
                  RecordCard(title: 'Average', number: '0.00'),
                  RecordCard(title: 'Fours', number: '0'),
                  RecordCard(title: 'Sixes', number: '0'),
                  RecordCard(title: 'Thirties', number: '0'),
                  RecordCard(title: 'Fifties', number: '0'),
                  RecordCard(title: 'Hundreds', number: '0'),
                  RecordCard(title: 'Ducks', number: '0')
                ],
              ),
              GridView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: const [
                  RecordCard(title: 'Matches', number: '1'),
                  RecordCard(title: 'Innings', number: '0'),
                  RecordCard(title: 'Overs', number: '0.0'),
                  RecordCard(title: 'Maidens', number: '0'),
                  RecordCard(title: 'Wickets', number: '0'),
                  RecordCard(title: 'Runs', number: '0'),
                  RecordCard(title: 'B.Bowling', number: '_'),
                  RecordCard(title: 'Eco. Rate', number: '0.00'),
                  RecordCard(title: 'Strike Rate', number: '0.0'),
                  RecordCard(title: 'Average', number: '0.00'),
                  RecordCard(title: 'Wides', number: '0'),
                  RecordCard(title: 'No Balls', number: '0'),
                  RecordCard(title: 'Dots balls', number: '0'),
                  RecordCard(title: '4 Wickets', number: '0'),
                  RecordCard(title: '5 Wickets', number: '0'),
                ],
              ),
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2),
                children: const [
                  RecordCard(title: 'Matches', number: '1'),
                  RecordCard(title: 'Catches', number: '0'),
                  RecordCard(title: 'Stumping', number: '0'),
                  RecordCard(title: 'Run Outs', number: '0')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
