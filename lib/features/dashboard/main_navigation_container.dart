import 'package:ceylon_cypher_app/features/dashboard/community_feed_content.dart';
import 'package:ceylon_cypher_app/features/dashboard/home_screen.dart';
import 'package:ceylon_cypher_app/features/dashboard/library_feed_content.dart';
import 'package:ceylon_cypher_app/features/dashboard/now_playing_screen.dart';
import 'package:ceylon_cypher_app/features/dashboard/profile_feed_content.dart';
import 'package:ceylon_cypher_app/features/dashboard/search_feed_content.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
// We move the previous Home code here

class MainNavigationContainer extends StatefulWidget {
  const MainNavigationContainer({super.key});

  @override
  State<MainNavigationContainer> createState() =>
      _MainNavigationContainerState();
}

class _MainNavigationContainerState extends State<MainNavigationContainer> {
  int _selectedIndex = 0;

  // The actual pages for each tab
  final List<Widget> _pages = [
    const HomeScreen(), // The code from our previous Home task
    const SearchFeedContent(),
    const LibraryFeedContent(),
    const CommunityFeedContent(),
    const ProfileFeedContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      body: Column(
        children: [
          Expanded(child: _pages[_selectedIndex]),
          _buildMiniPlayer(), // Mini player stays above the Nav Bar
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Required for 4+ items
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.oceanBlue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music_rounded), label: 'Library'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_rounded), label: 'Community'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }

  // Re-using the Mini Player from the Home Feed.jpg design
  Widget _buildMiniPlayer() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const NowPlayingScreen(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
                color: Colors.black12,
                width: 0.5), // Changed to top for bottom bar alignment
            bottom: BorderSide(color: Colors.black12, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            // Album Art
            Hero(
              tag:
                  'current-art', // Must match the tag on the Now Playing screen
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network('https://picsum.photos/40/40',
                    width: 40, height: 40),
              ),
            ),
            const SizedBox(width: 12),
            // Track Info (Tapping here opens Now Playing)
            const Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('The Atlantic Crossing',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: AppColors.deepNavy)),
                  Text('SonicStream Original',
                      style: TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
            ),
            // Playback Controls (Tapping these will NOT open Now Playing)
            IconButton(
              icon: const Icon(Icons.skip_previous_rounded),
              color: AppColors.deepNavy,
              onPressed: () {
                print("Previous Track");
              },
            ),
            IconButton(
              icon: const Icon(
                  Icons.play_arrow_rounded), // Or Icons.pause_rounded
              color: AppColors.deepNavy,
              iconSize: 32, // Make play/pause slightly larger
              onPressed: () {
                print("Play/Pause Toggle");
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next_rounded),
              color: AppColors.deepNavy,
              onPressed: () {
                print("Next Track");
              },
            ),
          ],
        ),
      ),
    );
  }
}
