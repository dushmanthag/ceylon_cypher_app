import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class LibraryFeedContent extends StatelessWidget {
  const LibraryFeedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      body: CustomScrollView(
        slivers: [
          _buildLibraryHeader(),
          _buildFilterChips(),
          _buildLibraryList(),
          const SliverToBoxAdapter(
              child: SizedBox(height: 100)), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildLibraryHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Text('JD',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 16),
            const Text('Your Library',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const Spacer(),
            IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final List<String> filters = [
      'Playlists',
      'Songs',
      'Albums',
      'Artists',
      'Downloaded'
    ];
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: filters.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(filters[index]),
              labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
              backgroundColor: Colors.white10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.white10)),
              onSelected: (val) {},
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLibraryList() {
    final List<Map<String, String>> libraryItems = [
      {
        'title': 'Liked Songs',
        'subtitle': 'Auto-playlist • 124 songs',
        'type': 'playlist'
      },
      {
        'title': 'The Atlantic Crossing',
        'subtitle': 'Album • SonicStream',
        'type': 'album'
      },
      {
        'title': 'Eminem - Technical Breakdown',
        'subtitle': 'Playlist • Ceylon Cypher',
        'type': 'playlist'
      },
      {
        'title': 'Nas - Illmatic Deep Dive',
        'subtitle': 'Album • Nas',
        'type': 'album'
      },
      {
        'title': 'Underground Spotlight',
        'subtitle': 'Playlist • Community',
        'type': 'playlist'
      },
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = libraryItems[index];
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            leading: ClipRRect(
              borderRadius:
                  BorderRadius.circular(item['type'] == 'artist' ? 30 : 4),
              child: Image.network(
                'https://picsum.photos/100/100?random=$index',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(item['title']!,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
            subtitle: Text(item['subtitle']!,
                style: const TextStyle(color: Colors.grey, fontSize: 13)),
            trailing: const Icon(Icons.more_vert, color: Colors.grey, size: 20),
            onTap: () {},
          );
        },
        childCount: libraryItems.length,
      ),
    );
  }
}
