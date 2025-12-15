// lib/widgets/place_list_card.dart

import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../models/place_model.dart';
import '../screens/city_guide/place_detail_screen.dart';

class PlaceListCard extends StatelessWidget {
  final Place place;

  const PlaceListCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(place: place),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 110,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
              child: Image.asset(
                place.imagePath,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => Container(width: 110, height: 110, color: Colors.grey.shade800, child: const Icon(Icons.image_not_supported, color: Colors.grey)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      place.name,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      place.description,
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                      maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(place.rating.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: kMarocRed.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kMarocRed.withOpacity(0.5)),
                          ),
                          child: Text(
                            place.type.name.toUpperCase(),
                            style: const TextStyle(color: kMarocRed, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
