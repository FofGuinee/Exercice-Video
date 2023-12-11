/// CE FICHIER EST UN EXAMPLE QUE JAI PRIS SUR UN TITU YOUTUBE; C'EST UN EXEMPLE POUR FAIRE JOUERUNE VIDEO 
/// AUSSI; MAIS DANS CE PROJETJE L'AI PAS UTILISEE, JAI UTILISE PLUTOT LE FICHIER prof.dart



/*import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class JouerVideo extends StatefulWidget {
  const JouerVideo({super.key, required this.titre, required this.videoUrl});
  final String titre;
  final Uri videoUrl;

  @override
  State<JouerVideo> createState() => _JouerVideoState();
}

class _JouerVideoState extends State<JouerVideo> {
  late VideoPlayerController dataVideo;
  late Future<void> initialiser;

  @override
  void initState() {
    super.initState();
    dataVideo = VideoPlayerController.networkUrl(widget.videoUrl);
    initialiser = dataVideo.initialize().then((value) {
      dataVideo.play();
      dataVideo.setLooping(true);
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    dataVideo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titre),
      ),
      body: FutureBuilder(
        future: initialiser, 
        builder: (context, snap){
          if(snap.connectionState == ConnectionState.done){
            return AspectRatio(
              aspectRatio: dataVideo.value.aspectRatio,
              child: VideoPlayer(dataVideo),
              );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
        ),
    );
  }

  configurePlayer() {}
}*/
