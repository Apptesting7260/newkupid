import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class CustomAudioPlayer extends StatefulWidget {
  final String audioUrl;

  CustomAudioPlayer({required this.audioUrl});

  @override
  _CustomAudioPlayerState createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  double _position = 0.0;
  double _duration = 1.0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.playing) {
        setState(() {
          _isPlaying = true;
        });
      } else {
        setState(() {
          _isPlaying = false;
        });
      }
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration.inMilliseconds.toDouble();
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _position = position.inMilliseconds.toDouble();
      });
    });

    await _audioPlayer.setSourceUrl(widget.audioUrl);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomEnd,
      height: 70,
      width: 200,
      decoration: BoxDecoration(
        border:Border.all(width: 1,color:Colors.black),
        borderRadius: BorderRadius.circular(20),
        // color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.black,
                    value: _duration > 0 ? _position / _duration : 0.0,
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    disabledElevation: 0,
                    elevation: 0,
                    focusElevation: 0,
                    hoverElevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.teal.withOpacity(0.1),
                    onPressed: () {
                      _togglePlayback();
                    },
                    child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.black87),
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Slider(
                  value: _position,
                  min: 0,
                  max: _duration,
                  onChanged: (double value) {
                    _seekToPosition(value);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


void _togglePlayback() {
  if (_isPlaying) {
    _audioPlayer.pause();
  } else {
    _audioPlayer.play(UrlSource(widget.audioUrl)); // Provide the audio source URL here
  }
}

  void _seekToPosition(double value) {
    _audioPlayer.seek(Duration(milliseconds: value.toInt()));
  }
}
