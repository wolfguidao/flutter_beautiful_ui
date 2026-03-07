import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import '../core/services/audio_player_service.dart';

class MusicPlayerWidget extends StatefulWidget {
  const MusicPlayerWidget({super.key});

  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  final AudioPlayerService _audioService = AudioPlayerService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: _audioService.player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing ?? false;

        // 如果没有正在播放的音乐，不显示播放器
        if (processingState == null || 
            processingState == ProcessingState.idle) {
          return const SizedBox.shrink();
        }

        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 进度条
              StreamBuilder<Duration>(
                stream: _audioService.player.positionStream,
                builder: (context, positionSnapshot) {
                  final position = positionSnapshot.data ?? Duration.zero;
                  final duration = _audioService.player.duration ?? Duration.zero;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ProgressBar(
                      progress: position,
                      total: duration,
                      onSeek: (duration) {
                        _audioService.seek(duration);
                      },
                      barHeight: 3,
                      thumbRadius: 6,
                      timeLabelTextStyle: const TextStyle(fontSize: 12),
                      progressBarColor: Theme.of(context).colorScheme.primary,
                      baseBarColor: Colors.grey[300],
                      thumbColor: Theme.of(context).colorScheme.primary,
                    ),
                  );
                },
              ),
              
              // 播放器控制
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: [
                    // 音乐图标
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.music_note,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // 歌曲信息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _audioService.currentTrackName ?? '正在播放',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          StreamBuilder<Duration>(
                            stream: _audioService.player.positionStream,
                            builder: (context, snapshot) {
                              final position = snapshot.data ?? Duration.zero;
                              final duration = _audioService.player.duration ?? Duration.zero;
                              return Text(
                                '${_formatDuration(position)} / ${_formatDuration(duration)}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    
                    // 控制按钮
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering)
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 32,
                        height: 32,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    else if (!playing)
                      IconButton(
                        icon: const Icon(Icons.play_arrow, size: 32),
                        onPressed: _audioService.resume,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    else
                      IconButton(
                        icon: const Icon(Icons.pause, size: 32),
                        onPressed: _audioService.pause,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    
                    // 停止按钮
                    IconButton(
                      icon: const Icon(Icons.stop),
                      onPressed: () {
                        _audioService.stop();
                        setState(() {});
                      },
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
