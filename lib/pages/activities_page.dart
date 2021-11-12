import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/pages/recipe_page.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ActivitiesPage extends StatefulWidget {
  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
  const ActivitiesPage({Key? key}) : super(key: key);
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '-0nhYjG9160',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktiviteter'),
        backgroundColor: Colors.teal[600],
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'home');
          },
          child: Icon(
            Icons.home_outlined,
            size: 28,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Text(
                      'Dagens udvalgte familieaktivitet',
                      style: TextStyle(
                        fontFamily: 'Margarine',
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                    YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
