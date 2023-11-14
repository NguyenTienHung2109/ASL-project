import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:signlingo/src/bloc/Learning_bloc.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/incorrect_footer.dart';

class PracticePage extends StatefulWidget {
  late String name;
  late Function nextLesson;
  late Function resetLesson;

  PracticePage({super.key, required this.name, required this.nextLesson});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PracticePageState();
  }
}

class _PracticePageState extends State<PracticePage> {
  bool _isLoading = true;
  late CameraController _cameraController;
  bool _isRecording = false;
  bool _recorded = false;
  bool _haveFrontCamera = false;
  int _countdown = 3;
  int _recordDuration = 5;
  LearningBloc _bloc = new LearningBloc();

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _startCountdown() async {
    for (int i = _countdown; i > 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _countdown = i;
      });
    }
  }

  Future<void> _recordVideo() async {
    if (!_isRecording) {
      print("Haha");

      _startCountdown();
      await Future.delayed(Duration(seconds: _countdown));
      print("Start recording");
      setState(() => _isRecording = true);
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      Timer(Duration(seconds: _recordDuration), () async {
        if (_isRecording) {
          final file = await _cameraController.stopVideoRecording();
          print('Dừng ghi video.');
          print(file.path);
          setState(() {
            _isRecording = false;
          });
        }
      });
    }

    // if (_isRecording) {
    //   final file = await _cameraController.stopVideoRecording();
    //   setState(() => _isRecording = false);
    // } else {
    //   await _cameraController.prepareForVideoRecording();
    //   await _cameraController.startVideoRecording();
    //   setState(() => _isRecording = true);
    // }
  }

  Future<void> _initCamera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      final cameras = await availableCameras();
      final front = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);
      print(front);
      print(cameras);
      _cameraController = CameraController(front, ResolutionPreset.max);
      await _cameraController.initialize();
      setState(() => _isLoading = false);
    } on CameraException catch (e) {
      // print(e.code);
      print(e);
      // _logError(e.code, e.description);
    }
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        color: Colors.white,
                        child: const Text(
                          "Let's try yourself!",
                          style: TextStyle(fontSize: 22, color: Colors.black87),
                        ),
                      ),
                      // Camera
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // color: Colors.blue.shade400,
                          border: Border.all(width: 0.1, color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5.0,
                                      color: _isRecording
                                          ? Colors.red
                                          : Colors.white),
                                  // borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: CameraPreview(_cameraController),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FloatingActionButton(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                      _isRecording ? Icons.stop : Icons.circle),
                                  onPressed: () {
                                    if (!_recorded) {
                                      setState(() {
                                        _recorded = true;
                                      });

                                      _recordVideo();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Video + Words
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        // margin: const EdgeInsets.symmetric(
                        //     horizontal: 30.0, vertical: 30.0),
                        margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            // Video
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                border:
                                    Border.all(width: 0.1, color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            // Word
                            Opacity(
                                opacity: 0.6,
                                child: Container(
                                  width: double.infinity,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    border: Border.all(
                                        width: 0.1, color: Colors.white),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.name,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ])),
    bottomNavigationBar: _isLoading ? null : IncorrectFooter(nextLesson: () {

    }, resetLesson: () {

    }, type: false),
            );
    // TODO: implement build
  }
}
