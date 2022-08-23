import 'package:flutter/material.dart';
import 'package:the_middlemen/Widgets/places_service.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  final sessionToken;
  PlaceApiProvider? apiClient;

  AddressSearch(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: query == "" ? null : apiClient?.fetchSuggestions(query),
        builder: (context, snapshot) => query == ""
            ? Container(
                child: Text("Enter your address"),
              )
            : snapshot.hasData
                ? ListView.builder(
                    itemBuilder: (context, i) => ListTile(
                      title: Text((snapshot.data as Suggestion).description),
                      onTap: () {},
                    ),
                    itemCount: 10,
                  )
                : Container(
                    child: CircularProgressIndicator(),
                  ));
  }
}
