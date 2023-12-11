import 'package:flutter/material.dart';
import 'package:video_exercice/controllers/controller_video.dart';
//import 'package:video_exercice/models/model_video.dart';
//import 'package:video_exercice/screens/jouvideo.dart';
import 'package:video_exercice/screens/prof.dart';

class HomePrincipale extends StatefulWidget {
  const HomePrincipale({super.key});

  @override
  State<HomePrincipale> createState() => _HomePrincipaleState();
}

class _HomePrincipaleState extends State<HomePrincipale> {
  //List<ModelVideo> dataModel = ControllerVideo().nosVideos;
  ControllerVideo controller = ControllerVideo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
      ),
      body: ListView.builder(
          itemCount: controller.nosVideos.length,
          itemBuilder: (context, item) {
            return InkWell(
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return ProfVideo(titre: controller.nosVideos[item].title, videoLien:controller.nosVideos[item].urlVideo);
                    //JouerVideo(titre: controller.nosVideos[item].title, videoUrl: controller.nosVideos[item].urlVideo,);
                  }));
                });
              },
              child: Card(
                margin: const EdgeInsets.all(10),
                elevation: 7,
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 8),
                  //height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Image.network(controller.nosVideos[item].thumbString),
                      Text(
                        controller.nosVideos[item].title,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
