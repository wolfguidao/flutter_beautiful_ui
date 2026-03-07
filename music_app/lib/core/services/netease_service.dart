import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:music_demo/models/netease_play_list.dart';
import 'package:music_demo/models/netease_track.dart';
import 'package:music_demo/models/play_list_tag.dart';

class NeteaseService {
  static String get _baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    } else if (Platform.isIOS) {
      return 'http://localhost:3000';
    } else {
      return 'http://localhost:3000';
    }
  }

  // 如果需要使用自定义 IP（真机调试时）
  static String? customBaseUrl;

  String get baseUrl => customBaseUrl ?? _baseUrl;

  // 获取歌单详情
  Future<List<NeteaseTrack>> getPlaylistDetail(int playlistId) async {
    final url = Uri.parse('$baseUrl/playlist/detail?id=$playlistId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // 检查 API 返回码
        if (data['code'] != 200) {
          throw Exception(
            'API error: ${data['message'] ?? data['msg'] ?? 'Unknown error'}',
          );
        }

        // 检查 playlist 字段
        if (data['playlist'] == null) {
          throw Exception('No playlist data in response');
        }

        // 检查 tracks 字段
        final playlist = data['playlist'];
        if (playlist['tracks'] == null) {
          throw Exception('No tracks in playlist');
        }

        final tracks = playlist['tracks'] as List;
        if (tracks.isEmpty) {
          return []; // 返回空列表而不是抛出异常
        }

        return tracks.map((track) => NeteaseTrack.fromJson(track)).toList();
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      // 提供更详细的错误信息
      if (e.toString().contains('SocketException')) {
        throw Exception('无法连接到服务器，请确保 API 服务正在运行 (http://localhost:3000)');
      }
      throw Exception('获取歌单失败: $e');
    }
  }

  // 获取音乐播放URL
  Future<String?> getSongUrl(int songId) async {
    final url = Uri.parse('$baseUrl/song/url?id=$songId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['code'] == 200 &&
            data['data'] != null &&
            data['data'].isNotEmpty) {
          return data['data'][0]['url'];
        }
      }
      return null;
    } catch (e) {
      throw Exception('Error getting song URL: $e');
    }
  }

  // 搜索音乐
  Future<List<NeteaseTrack>> searchSongs(
    String keywords, {
    int limit = 30,
  }) async {
    final url = Uri.parse(
      '$baseUrl/search?keywords=${Uri.encodeComponent(keywords)}&limit=$limit',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['code'] == 200 && data['result'] != null) {
          final songs = data['result']['songs'] as List;
          return songs.map((song) => NeteaseTrack.fromJson(song)).toList();
        } else {
          throw Exception('API returned error code: ${data['code']}');
        }
      } else {
        throw Exception('Failed to search songs: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error searching songs: $e');
    }
  }

  // 获取精品歌单标签
  Future<List<PlaylistTag>> getPlaylistTags() async {
    final url = Uri.parse('$baseUrl/playlist/highquality/tags');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['code'] != 200) {
          throw Exception(
            'API error: ${data['message'] ?? data['msg'] ?? 'Unknown error'}',
          );
        }

        if (data['tags'] == null) {
          throw Exception('No tags data in response');
        }

        final tags = data['tags'] as List;
        return tags.map((tag) => PlaylistTag.fromJson(tag)).toList();
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        throw Exception('无法连接到服务器，请确保 API 服务正在运行');
      }
      throw Exception('获取歌单标签失败: $e');
    }
  }

  // 获取精品歌单（根据标签）
  Future<List<NeteasePlaylist>> getHighQualityPlaylists({
    String? cat,
    int limit = 20,
    int before = 0,
  }) async {
    var urlStr = '$baseUrl/top/playlist/highquality?limit=$limit';
    if (cat != null && cat.isNotEmpty) {
      urlStr += '&cat=${Uri.encodeComponent(cat)}';
    }
    if (before > 0) {
      urlStr += '&before=$before';
    }

    final url = Uri.parse(urlStr);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['code'] != 200) {
          throw Exception(
            'API error: ${data['message'] ?? data['msg'] ?? 'Unknown error'}',
          );
        }

        if (data['playlists'] == null) {
          throw Exception('No playlists data in response');
        }

        final playlists = data['playlists'] as List;
        return playlists
            .map((playlist) => NeteasePlaylist.fromJson(playlist))
            .toList();
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        throw Exception('无法连接到服务器，请确保 API 服务正在运行');
      }
      throw Exception('获取精品歌单失败: $e');
    }
  }

  // 获取歌单分类列表（保留旧方法）
  Future<List<NeteasePlaylist>> getTopPlaylists({
    int limit = 10,
    String order = 'new',
  }) async {
    final url = Uri.parse('$baseUrl/top/playlist?limit=$limit&order=$order');
    print(url.toString());

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['code'] != 200) {
          throw Exception(
            'API error: ${data['message'] ?? data['msg'] ?? 'Unknown error'}',
          );
        }

        if (data['playlists'] == null) {
          throw Exception('No playlists data in response');
        }

        final playlists = data['playlists'] as List;
        return playlists
            .map((playlist) => NeteasePlaylist.fromJson(playlist))
            .toList();
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        throw Exception('无法连接到服务器，请确保 API 服务正在运行 (http://localhost:3000)');
      }
      throw Exception('获取歌单列表失败: $e');
    }
  }

  // 获取歌单的所有歌曲
  Future<List<NeteaseTrack>> getPlaylistTracks(
    int playlistId, {
    int limit = 50,
    int offset = 0,
  }) async {
    final url = Uri.parse(
      '$baseUrl/playlist/track/all?id=$playlistId&limit=$limit&offset=$offset',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['code'] != 200) {
          throw Exception(
            'API error: ${data['message'] ?? data['msg'] ?? 'Unknown error'}',
          );
        }

        if (data['songs'] == null) {
          throw Exception('No songs data in response');
        }

        final songs = data['songs'] as List;
        if (songs.isEmpty) {
          return [];
        }

        return songs.map((song) => NeteaseTrack.fromJson(song)).toList();
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        throw Exception('无法连接到服务器，请确保 API 服务正在运行 (http://localhost:3000)');
      }
      throw Exception('获取歌单歌曲失败: $e');
    }
  }

  // 获取推荐歌单
  Future<List<Map<String, dynamic>>> getRecommendPlaylists({
    int limit = 10,
  }) async {
    final url = Uri.parse('$baseUrl/personalized?limit=$limit');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['code'] == 200) {
          return List<Map<String, dynamic>>.from(data['result']);
        } else {
          throw Exception('API returned error code: ${data['code']}');
        }
      } else {
        throw Exception('Failed to load playlists: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting playlists: $e');
    }
  }

  // 获取热门歌曲（使用热歌榜）
  Future<List<NeteaseTrack>> getHotSongs() async {
    // 使用热歌榜 ID: 3778678
    return getPlaylistDetail(3778678);
  }
}
