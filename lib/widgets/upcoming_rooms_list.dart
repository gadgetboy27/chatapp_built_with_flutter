
import 'package:flutter/material.dart';
import 'package:friendlychat/config/palette.dart';
import '../data.dart';

class UpcomingRoomsList extends StatelessWidget {
  final List<Room> upcomingRoomsList;

  const UpcomingRoomsList({
    Key? key, 
    required this.upcomingRoomsList,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0,top: 4.0,bottom: 4.0),
        child: Column(
          children: upcomingRoomsList.map(
            (e)=>Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: 
                      EdgeInsets.only(top: e.club.isNotEmpty ? 2.0:0),
                    child: Text(e.time),
                  ),
                  const SizedBox(width: 2.0),
                  Column(
                    children: [
                      if(e.club.isNotEmpty)
                        Text('${e.club} 🏠'.toUpperCase(),
                         style: Theme.of(context)
                         .textTheme.overline!
                         .copyWith(
                           fontWeight: FontWeight.w600,
                           letterSpacing: 1.0),
                        ),
                      Text(e.name),
                    ],
                  )
              ],
           ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
