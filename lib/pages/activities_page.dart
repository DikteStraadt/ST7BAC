import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/pages/recipe_page.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ActivitiesPage extends StatefulWidget {
  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
  const ActivitiesPage({Key? key}) : super(key: key);
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  void dispose() {
    // _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '-0nhYjG9160',
    params: YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktiviteter'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.home_outlined,
            size: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              Text(
                'Dagens udvalgte familieaktivitet',
                style: TextStyle(
                  fontFamily: 'Margarine',
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xfff001c7c), width: 3),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Column(
                      children: [
                        // SizedBox(
                        //     height: MediaQuery.of(context).size.width * 0.07),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: YoutubePlayerIFrame(
                            controller: _controller,

                            // aspectRatio: 16 / 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              new Text(
                'Vend tilbage i morgen for en ny aktivitetsvideo',
                style: TextStyle(
                  fontFamily: 'Margarine',
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
