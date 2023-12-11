import 'package:flutter/material.dart';
import 'package:video_exercice/controllers/controller_video.dart';
import "package:video_player/video_player.dart";

// ignore: must_be_immutable
class ProfVideo extends StatefulWidget {
  ProfVideo({super.key, required this.titre, required this.videoLien});
  final String titre;
  Uri videoLien;

  @override
  State<ProfVideo> createState() => _ProfVideoState();
}

class _ProfVideoState extends State<ProfVideo> {
  late VideoPlayerController contVideo;
  late int index; // VA NOUS PERMETTRE DE GERER LES BOUTONS (NEXT, PREVIOUS, PLAY EN BAS)
  ControllerVideo controller = ControllerVideo();
  int getIndex() => controller.nosVideos.indexWhere((vid) => widget.videoLien == vid.urlVideo);

  bool canMountVideoPlayer() => contVideo.value.isInitialized;
  bool isPlaying() => contVideo.value.isPlaying; //EST CE LA VIDEO JOUE ?

  @override
  void initState() {
    super.initState();
    index = getIndex(); // APPEL DE L'INDEX QUI EST EN HAUT
    configurePlayer(); // APPEL DE NOTRE FONCTION QU'UON A DEFINIT EN BAS
  }

  @override
  void dispose() {
    super.dispose();
    deletePlayer(); // APPEL DE NOTRE FONCTION QU'UON A DEFINIT EN BAS
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            canMountVideoPlayer() // EST CE QUE JE PEUX MONTER LA VIDEO(LA JOUER EN FAIT)
                ? Container(
                    color: Colors.red,
                    height: 200,
                    width: 200,
                    child: AspectRatio(
                      // CE WIDGET VEUT DIRE LA PLACE QUE JE VEUX VOULOIR
                      aspectRatio: contVideo.value.aspectRatio,
                      child: VideoPlayer(contVideo),
                    ),
                  )
                : Container(),
            Text(
              widget.titre,
              style: const TextStyle(fontSize: 25, color: Colors.purple),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Card(
                elevation: 3,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              fonctionPreviousVideo();
                            });
                          },
                          icon: const Icon(Icons.skip_previous)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              fonctionPauseVideo();
                            });
                          },
                          icon: Icon(isPlaying()
                              ? Icons.pause_circle
                              : Icons.play_circle)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              fonctionNextVideo();
                            });
                          },
                          icon: const Icon(Icons.skip_next)),
                    ],
                  ),
                ),
              ),
            ),
            VideoProgressIndicator(contVideo,
                allowScrubbing:
                    true), //POUR INDIQUER LA PROGRESSION DE LA VIDEO
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                    '${contVideo.value.duration.inSeconds}s'), //AFFICHER LA DUREE TOTALE DE LA VIDEO EN SECONDES
                Text(
                    '${contVideo.value.position.inSeconds}s'), //AFFICHER LA POSITION DE LA POSITION EN SECNDES
              ],
            ),
            // POUR AFFICHER LES AUTRES VIDEOS EN BAS AU CAS OU LE CLIENT VEUT DIRECTEMENT CLIQUER POUR VOIR LA VIDEO
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.nosVideos.length,
                itemBuilder: (context, item){
                  return InkWell(
                    onTap: () {
                      setState(() {
                        
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        child: Image.network(controller.nosVideos[item].thumbString,
                        fit: BoxFit.cover,
                        ),
                        ),
                    )
                  );
                }
                ),
            ),
          ],
        ),
      ),
    );
  }

  configurePlayer() {
    //FONCTION POUR CONFIGURER NOTRE VIDEO AFIN QU'ON PUISSE LA JOUER
    contVideo = VideoPlayerController.networkUrl(
        widget.videoLien); //LE LIEN DE LA VIDEO POUR JOUER
    contVideo.initialize().then((isInit) {
      update(); // METRE A JOUR LA VIDEO
    });
    contVideo.setLooping(true); // QU'IL SOIS EN BOUCLE QUAND LA VIDEO JOUE
    contVideo.addListener(() {
      update();
    }); //POUR ECOUTER
    contVideo.play(); // POUR JOUR LA VIDEO
  }

  update() {
    //FONCTION POUR METTRE A JOUR LA VIDEO
    setState(() {});
  }

  deletePlayer() {
    // POUR ARRETER LA VIDEO DANS LA CONSOLE QUAND ON QUITTE LA VIDEO SUR L'ECRAN DU CLIENT
    contVideo.dispose();
  }

  fonctionPauseVideo() {
    isPlaying() 
    ? contVideo.pause()
    : contVideo.play();
    update();
  }

  fonctionNextVideo() {
    index = (index == controller.nosVideos.length - 1) ? 0 : index + 1;
    widget.videoLien = controller.nosVideos[index].urlVideo;
    configurePlayer();
  }

  fonctionPreviousVideo() {
    index = (index == 0) ? controller.nosVideos.length - 1 : index - 1;
    widget.videoLien = controller.nosVideos[index].urlVideo;
    configurePlayer();
  }
}
