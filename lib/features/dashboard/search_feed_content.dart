import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SearchFeedContent extends StatelessWidget {
  const SearchFeedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildSearchBar(),
          _buildRecentLogsHeader(),
          _buildRecentLogsList(),
          _buildGridHeader(),
          _buildNavigationalGrid(),
          const SliverToBoxAdapter(
              child: SizedBox(height: 100)), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 20, 24, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('EXPLORATION',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1)),
            Icon(Icons.explore_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search charts, vessels, or melodies...',
            hintStyle: TextStyle(color: Colors.grey.shade500),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: const Icon(Icons.mic_none, color: Colors.grey),
            filled: true,
            fillColor: Colors.white10,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentLogsHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('RECENT LOGS',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
            Text('CLEAR ALL',
                style: TextStyle(
                    color: AppColors.primaryOrange.withOpacity(0.8),
                    fontSize: 10,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentLogsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.history, color: Colors.grey.shade700, size: 20),
              Icon(Icons.close, color: Colors.grey.shade700, size: 18),
            ],
          ),
        ),
        childCount: 3,
      ),
    );
  }

  Widget _buildGridHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('NAVIGATIONAL CHARTS',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
            Text('BROWSE BY REGION',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationalGrid() {
    final List<Map<String, String>> charts = [
      {'title': 'DEEP SEA JAZZ', 'coord': '45° N, 12° W'},
      {'title': 'ARCTIC AMBIENT', 'coord': '82° N, 05° E'},
      {'title': 'TROPIC BEATS', 'coord': '02° S, 40° W'},
      {'title': 'STORM CHASE ROCK', 'coord': '35° N, 75° W'},
      {'title': 'FOLK HARBORS', 'coord': '51° N, 01° E'},
      {'title': 'SIREN CHANTS', 'coord': '15° N, 140° E'},
      {'title': 'COASTAL LO-FI', 'coord': '34° N, 118° W'},
      {'title': 'GULF SOUL', 'coord': '25° N, 90° W'},
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                    'https://picsum.photos/200/200?blur=2&random=$index'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.darken),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(charts[index]['coord']!,
                      style: const TextStyle(color: Colors.grey, fontSize: 10)),
                  const SizedBox(height: 4),
                  Text(charts[index]['title']!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ],
              ),
            ),
          ),
          childCount: charts.length,
        ),
      ),
    );
  }
}
