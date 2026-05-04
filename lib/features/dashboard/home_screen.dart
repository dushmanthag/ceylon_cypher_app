import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy, // Dark background as per Home.png
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  _buildHeader(),
                  _buildHeroCard(),
                  _buildSectionHeader('RECENT CHARTS', showViewAll: true),
                  _buildRecentCharts(),
                  _buildManifestSection(),
                  _buildNewDiscoveries(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 1. Header with Avatar
  Widget _buildHeader() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('LOG DATE: 24 OCT',
                    style: TextStyle(color: Colors.grey, fontSize: 10)),
                Text('Welcome, Captain',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('JD',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  // 2. Featured Hero Card
  Widget _buildHeroCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=1000'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: const Text('DAILY VOYAGE',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              const Text('The Atlantic Crossing',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.oceanBlue,
                    foregroundColor: Colors.white),
                onPressed: () {},
                icon: const Icon(Icons.play_arrow, size: 18),
                label: const Text('Begin Voyage'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 3. Section Headers
  Widget _buildSectionHeader(String title, {bool showViewAll = false}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2)),
            if (showViewAll)
              const Text('VIEW ALL',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  // 4. Horizontal Scrolling Charts
  Widget _buildRecentCharts() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 20),
          itemCount: 3,
          itemBuilder: (context, index) => Container(
            width: 150,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                      'https://picsum.photos/150/150?random=$index',
                      fit: BoxFit.cover),
                ),
                const SizedBox(height: 8),
                Text('Ambient Waves',
                    style:
                        TextStyle(color: Colors.grey.shade400, fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 5. Vertical List (The Manifest)
  Widget _buildManifestSection() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Text('0${index + 1}',
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
              const SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                    'https://picsum.photos/40/40?random=${index + 10}',
                    width: 40,
                    height: 40),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Midnight Meridian',
                        style: TextStyle(
                            color: AppColors.deepNavy,
                            fontWeight: FontWeight.bold)),
                    Text('The Navigator',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
        ),
        childCount: 3,
      ),
    );
  }

  // 6. Footer Player
  Widget _buildMiniPlayer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network('https://picsum.photos/40/40',
                width: 40, height: 40),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('The Atlantic Crossing',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text('SonicStream Original',
                    style: TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          const Icon(Icons.skip_previous_rounded),
          const SizedBox(width: 16),
          const Icon(Icons.pause_rounded),
          const SizedBox(width: 16),
          const Icon(Icons.skip_next_rounded),
        ],
      ),
    );
  }

  Widget _buildNewDiscoveries() {
    return const SliverToBoxAdapter(child: SizedBox(height: 100)); // Spacer
  }
}
