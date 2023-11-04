import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final nameNurse = [
    'Jaelyn',
    'Marisa',
    'Vanessa',
    'Maliyah',
    'Jaqueline',
    'Emelia',
    'Aaliyah'
  ];
  final recentNurse = ['Maliyah', 'Jaqueline', 'Emelia', 'Aaliyah'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentNurse : nameNurse;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.female_rounded),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
