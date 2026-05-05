import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class CommunityFeedContent extends StatelessWidget {
  const CommunityFeedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      appBar: AppBar(
        backgroundColor: AppColors.deepNavy,
        elevation: 0,
        title: const Text('VOYAGE LOGS',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2)),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.only(bottom: 100),
        itemBuilder: (context, index) => _buildPostCard(context, index),
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Artist Info
          ListTile(
            leading: const CircleAvatar(
              backgroundImage:
                  NetworkImage('https://picsum.photos/100/100?random=artist'),
            ),
            title: const Text('Eminem',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: const Text('2 hours ago',
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            trailing: const Icon(Icons.more_horiz, color: Colors.grey),
          ),

          // Post Content
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Just dropped a new breakdown of technical lyricism in the latest cypher. Check the rhyme schemes! ⚓️",
              style:
                  TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
            ),
          ),

          // Image / Media
          if (index % 2 == 0)
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8),
              child: Image.network(
                  'https://picsum.photos/400/200?random=$index',
                  fit: BoxFit.cover),
            ),

          // Action Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _buildActionButton(Icons.thumb_up_off_alt_rounded, '1.2k',
                    AppColors.oceanBlue),
                const SizedBox(width: 16),
                _buildActionButton(
                  Icons.chat_bubble_outline_rounded,
                  '84',
                  Colors.grey,
                  onTap: () => _showCommentSheet(context),
                ),
                const Spacer(),
                const Icon(Icons.share_outlined, color: Colors.grey, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 6),
          Text(label,
              style: TextStyle(
                  color: color, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void _showCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.deepNavy,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text('Manifest Discussion',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 10,
                    itemBuilder: (context, index) => _buildCommentTile(),
                  ),
                ),
                _buildCommentInput(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCommentTile() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage('https://picsum.photos/50/50')),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('UserHimasha',
                    style: TextStyle(
                        color: AppColors.skyBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text(
                    'The flow on this track is absolutely nautical. Great breakdown!',
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(30)),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Add to the manifest...',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.send_rounded, color: AppColors.primaryOrange),
        ),
      ),
    );
  }
}
