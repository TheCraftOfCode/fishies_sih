import 'dart:io';
import 'package:fishies_sih/screens/saved_data.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraApp({Key? key, required this.cameras}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> with WidgetsBindingObserver, TickerProviderStateMixin{
  late CameraController controller;
  List<XFile> imageList = [];

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras![0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller = CameraController(widget.cameras![1], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var resp;

    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    //TODO: Don't nest material app inside material
    return MaterialApp(
      home: Column(
        children: [
          Expanded(
            flex: 10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  child: CameraPreview(controller),
                  alignment: Alignment.bottomCenter,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: FloatingActionButton(
                          onPressed: () async {
                            var xFile = await controller.takePicture();
                            imageList.add(xFile);
                            setState(() {});
                          },
                          child: const Icon(Icons.camera),
                        ),
                      ),
                      if(imageList.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: FloatingActionButton(
                            onPressed: () async {
                              for (var i in imageList) {
                                //TODO: Redirect user after saving
                                await GallerySaver.saveImage(i.path);
                                File imagefile = File(i.path); //convert Path to File
                                Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
                                String base64string = base64.encode(imagebytes); //convert bytes to base64 string
                                print(base64string);
                                var url = Uri.parse('http://192.168.29.188:5000/');
                                var response = await http.post(url, body:{
                                'base':base64string
                                });
                                resp= response.body;
                                print('Response status: ${response.statusCode}');
                                print('Response body: ${resp}');

                              }
                              Navigator.pushReplacement<void, void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => SavedDataPage(resp:resp),
                                ),
                              );
                            },
                            child: const Icon(Icons.check),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth: constraints.maxHeight,
                              maxHeight: constraints.maxHeight),
                          color: Colors.blueAccent,
                          child: Image.file(
                            File(imageList[index].path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Container(
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}