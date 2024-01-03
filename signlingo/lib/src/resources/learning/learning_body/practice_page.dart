import 'dart:async' show Future, Timer;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signlingo/src/bloc/Learning_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signlingo/src/repository/video_youtube.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/check_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/correct_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/incorrect_footer.dart';
import 'package:signlingo/src/resources/learning/learning_body/learning_footer/loading_footer.dart';

class PracticePage extends StatefulWidget {
  late String name;
  late Function nextLesson;
  late Function resetLesson;
  int score = 0;

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
  bool _doneRecorded = false;
  bool _haveFrontCamera = false;
  int _countdown = 3;
  int _recordDuration = 5;
  LearningBloc _bloc = new LearningBloc();
  bool _isChecking = false;
  bool _checked = false;
  bool _result = false;
  var file;

  Widget _footer = SizedBox.shrink();

  @override
  void dispose() {
    // if (!_isLoading) {
    //   // Dừng sử dụng camera
    //   // _cameraController.stopImageStream();
    //   // _cameraController.dispose();
    // }
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> checkCameraPermission() async {
    // PermissionStatus status = await Permission.camera.status;
    // print(status);
    // if (status == PermissionStatus.denied) {
    //   // Yêu cầu quyền truy cập camera
    //   await Permission.camera.request();
    // }
    // if (status == PermissionStatus.granted) {
    //   _initCamera();
    // }
    _initCamera();
  }

  Future<void> checkLesson() async {
    if (_doneRecorded && !_checked) {
      setState(() {
        _checked = true;
        _isChecking = true;
      });
      _result = await _bloc.isCorrectVideo(file, widget.name);
      setState(() {
        _isChecking = false;
      });
    }
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
      // print("Haha");

      _startCountdown();
      await Future.delayed(Duration(seconds: _countdown));
      // print("Start recording");
      setState(() => _isRecording = true);
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      Timer(Duration(seconds: _recordDuration), () async {
        if (_isRecording) {
          file = await _cameraController.stopVideoRecording();
          // print('Dừng ghi video.');
          print(file.path);
          setState(() {
            _isRecording = false;
            _doneRecorded = true;
          });
          // dispose();
          // _cameraController.dispose();
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
      // print(front);
      // print(cameras);
      _cameraController = CameraController(front, ResolutionPreset.max, enableAudio: false);
      // print(_cameraController);
      await _cameraController.initialize();
      await _cameraController.lockCaptureOrientation(DeviceOrientation.landscapeRight);
      // print(_cameraController);
      setState(() => _isLoading = false);
    } on CameraException catch (e) {
      // print(e.code);
      // print(e);
      // _logError(e.code, e.description);
    }
  }

  @override
  void initState() {
    super.initState();
    checkCameraPermission();
  }

  @override
  Widget build(BuildContext context) {
    if (_doneRecorded) {
      setState(() {
        if (!_checked) {
          _footer = CheckFooter(checkLesson: () async {
            await checkLesson();
          });
        } else {
          if (_isChecking) {
            _footer = LoadingFooter();
          } else {
            if (_result) {
              _footer = CorrectFooter(nextLesson: () {
                _cameraController.dispose();
                widget.score = 1;
                widget.nextLesson();
              });
            } else {
              _footer = IncorrectFooter(
                  nextLesson: () {
                    _cameraController.dispose();
                    widget.nextLesson();
                  },
                  resetLesson: () {
                    widget.resetLesson();
                  },
                  type: true);
            }
          }
        }
      });
    }

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
                                // color: Colors.blue,
                                border:
                                    Border.all(width: 0.1, color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: VideoYoutube(widget.name),
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
                                    LearningBloc.toUpper(widget.name),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ])),
        bottomNavigationBar: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: _footer,
        ));
    // TODO: implement build
  }
}
