import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    return places.isEmpty
        ? Center(
            child: Text(
              'Nothing to show here..!',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
          )
        : ListView.builder(
            itemCount: places.length,
            itemBuilder: (ctx, idx) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => PlaceDetailScreen(places[idx]),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage: FileImage(places[idx].image),
                    ),
                    title: Text(
                      places[idx].title,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ));
  }
}
