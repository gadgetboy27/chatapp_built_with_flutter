import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/widgets/upcoming_rooms_list.dart';
import 'package:friendlychat/widgets/widgets.dart';
import 'package:friendlychat/data.dart';



class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.search,
            size: 30.0,
          ),
          onPressed: (){},
        ),
        actions: [
            IconButton(
          icon: const Icon(
            CupertinoIcons.envelope_open,
            size: 26.0,
          ),
          onPressed: (){},
        ),
            IconButton(
          icon: const Icon(
            CupertinoIcons.calendar,
            size: 30.0,
          ),
          onPressed: (){},
        ),
          IconButton(
          icon: const Icon(
            CupertinoIcons.bell,
            size: 30.0,
          ),
          onPressed: (){},
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            8.0, 10.0, 20.0, 10.0),
          child: UserProfileImage(
          imageUrl: currentUser.imageUrl,size:36.0),
        ),
       ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 120.0),
        children: [
          UpcomingRoomsList(upcomingRoomsList:upcomingRoomsList)
        ],
      ),
    );
  }
}