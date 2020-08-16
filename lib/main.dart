import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:video_player/video_player.dart';

void main(List<String> args) {
  runApp(Home());
}

var url = 'https://www.kozco.com/tech/LRMonoPhase4.mp3';
final audioo = AssetsAudioPlayer();

playAudiofromAssets() {
  print("Played");
  audioo.open(
    Audio('assets/audios/ash.mp3'),
  );
  audioo.playOrPause();
}

playAudiofromInt() {
  print("p");
  audioo.open(Audio.network(url));
}

stopAudio() {
  audioo.pause();
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("AUDIO  PLAYER"),
          leading:
              IconButton(icon: Icon(Icons.music_note), onPressed: () => {}),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/mic.jpg'), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 5, color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "PLAY AUDIO FROM ASSET",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: playAudiofromAssets,
                            child: Icon(Icons.play_arrow),
                            color: Colors.grey[100],
                          ),
                          Container(
                            height: 5,
                            width: 5,
                          ),
                          RaisedButton(
                            onPressed: stopAudio,
                            child: Icon(Icons.pause),
                            color: Colors.grey[100],
                          )
                        ],
                      ),
                      Container(
                        height: 30,
                        width: double.infinity,
                      ),
                      Text(
                        "PLAY AUDIO FROM INTERNET",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () async {
                              await audioo.open(Audio.network(url));
                            },
                            child: Icon(Icons.play_arrow),
                            color: Colors.grey[100],
                          ),
                          Container(
                            height: 5,
                            width: 5,
                          ),
                          RaisedButton(
                            onPressed: stopAudio,
                            child: Icon(Icons.pause),
                            color: Colors.grey[100],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
