import 'package:flutter/material.dart';
import 'package:music_demo/models/netease_play_list.dart';
import 'package:music_demo/models/netease_track.dart';
import 'package:music_demo/models/play_list_tag.dart';
import 'core/services/netease_service.dart';
import 'core/services/audio_player_service.dart';
import 'widgets/music_player_widget.dart';

void main() {  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网易云音乐 Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MusicHomePage(),
    );
  }
}

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({super.key});

  @override
  State<MusicHomePage> createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  final NeteaseService _musicService = NeteaseService();
  final AudioPlayerService _audioService = AudioPlayerService();
  List<PlaylistTag> _tags = [];
  List<NeteasePlaylist> _playlists = [];
  List<NeteaseTrack> _tracks = [];
  PlaylistTag? _selectedTag;
  NeteasePlaylist? _selectedPlaylist;
  bool _isLoading = false;
  bool _isLoadingPlaylists = false;
  bool _isLoadingTracks = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    // 打印 API 地址用于调试
    print('🌐 API Base URL: ${_musicService.baseUrl}');
    _loadTags();
  }

  Future<void> _loadTags() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final tags = await _musicService.getPlaylistTags();
      setState(() {
        _tags = tags;
        _isLoading = false;
      });
      
      // 自动加载第一个标签的歌单
      if (tags.isNotEmpty) {
        _loadPlaylistsByTag(tags[0]);
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _loadPlaylistsByTag(PlaylistTag tag) async {
    setState(() {
      _isLoadingPlaylists = true;
      _selectedTag = tag;
      _selectedPlaylist = null;
      _tracks = [];
      _error = null;
    });

    try {
      final playlists = await _musicService.getHighQualityPlaylists(
        cat: tag.name,
        limit: 20,
      );
      setState(() {
        _playlists = playlists;
        _isLoadingPlaylists = false;
      });
      
      // 自动加载第一个歌单的歌曲
      if (playlists.isNotEmpty) {
        _loadPlaylistTracks(playlists[0]);
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoadingPlaylists = false;
      });
    }
  }

  Future<void> _loadPlaylistTracks(NeteasePlaylist playlist) async {
    setState(() {
      _isLoadingTracks = true;
      _selectedPlaylist = playlist;
      _error = null;
    });

    try {
      final tracks = await _musicService.getPlaylistTracks(playlist.id, limit: 50);
      setState(() {
        _tracks = tracks;
        _isLoadingTracks = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoadingTracks = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_selectedPlaylist != null 
            ? '🎵 ${_selectedPlaylist!.name}' 
            : _selectedTag != null
                ? '🎵 ${_selectedTag!.name}'
                : '🎵 网易云音乐'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadTags,
          ),
        ],
      ),
      body: Column(
        children: [
          // 标签选择器
          if (_tags.isNotEmpty)
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _tags.length,
                itemBuilder: (context, index) {
                  final tag = _tags[index];
                  final isSelected = _selectedTag?.id == tag.id;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(tag.name),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          _loadPlaylistsByTag(tag);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          const Divider(height: 1),
          // 歌单选择器
          if (_playlists.isNotEmpty)
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _playlists.length,
                itemBuilder: (context, index) {
                  final playlist = _playlists[index];
                  final isSelected = _selectedPlaylist?.id == playlist.id;
                  return GestureDetector(
                    onTap: () => _loadPlaylistTracks(playlist),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: isSelected
                                  ? Border.all(
                                      color: Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                playlist.coverImgUrl ?? '',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.music_note, size: 40),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            playlist.name,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected 
                                  ? Theme.of(context).colorScheme.primary 
                                  : null,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          const Divider(height: 1),
          Expanded(child: _buildContent()),
          const MusicPlayerWidget(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('加载标签中...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                '错误: $_error',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadTags,
              child: const Text('重试'),
            ),
          ],
        ),
      );
    }

    if (_isLoadingPlaylists) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('加载歌单中...'),
          ],
        ),
      );
    }

    if (_isLoadingTracks) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('加载歌曲中...'),
          ],
        ),
      );
    }

    if (_tracks.isEmpty) {
      return const Center(
        child: Text('请选择标签和歌单'),
      );
    }

    return ListView.builder(
      itemCount: _tracks.length,
      itemBuilder: (context, index) {
        final track = _tracks[index];
        return MusicCard(
          track: track,
          index: index,
          onTap: () => _handleTrackTap(track, index),
        );
      },
    );
  }

  Future<void> _handleTrackTap(NeteaseTrack track, int index) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // 获取播放URL
      final playUrl = await _musicService.getSongUrl(track.id);
      
      if (playUrl == null || playUrl.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('无法获取播放链接'),
              backgroundColor: Colors.red,
            ),
          );
        }
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // 设置播放URL
      track.playUrl = playUrl;

      // 播放音乐
      await _audioService.playUrl(playUrl, trackName: track.name);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('正在播放: ${track.name}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('播放失败: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MusicCard extends StatelessWidget {
  final NeteaseTrack track;
  final int index;
  final VoidCallback? onTap;

  const MusicCard({
    super.key, 
    required this.track, 
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // 序号
              SizedBox(
                width: 30,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 12),
              // 专辑封面
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  track.albumPicUrl ?? '',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[300],
                      child: const Icon(Icons.music_note, size: 25),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              // 歌曲信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      track.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      track.artistsString,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // 时长
              Text(
                track.durationString,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.play_circle_outline, 
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
