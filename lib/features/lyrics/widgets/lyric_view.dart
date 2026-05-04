import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/lyric_line.dart';

class LyricView extends StatefulWidget {
  final List<LyricLine> lyrics;

  const LyricView({super.key, required this.lyrics});

  @override
  State<LyricView> createState() => _LyricViewState();
}

class _LyricViewState extends State<LyricView> {
  // This triggers the community insight panel
  void _showInsightPanel(String insightId, String lyricText) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.deepNavy,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle for dragging
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Text(
                  'INSIGHT: "${lyricText.length > 30 ? '${lyricText.substring(0, 30)}...' : lyricText}"',
                  style: const TextStyle(
                    color: AppColors.skyBlue,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Community Manifest',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 2, // Placeholder count
                    itemBuilder: (context, index) => _buildInsightTile(
                      index == 0 ? 'UserHimasha' : 'VidhyaK',
                      index == 0
                          ? 'This technical rhyme scheme utilizes a maritime metaphor common in 90s boom-bap.'
                          : 'Double entendre here referencing the harbor and the internal state of the artist.',
                      index == 0 ? 24 : 12, // Pass the vote counts here
                    ),
                  ),
                ),
                const Divider(color: Colors.white10, height: 32),
                _buildInsightInput(),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      itemCount: widget.lyrics.length,
      itemBuilder: (context, index) {
        final line = widget.lyrics[index];
        return _buildLyricLine(line);
      },
    );
  }

  Widget _buildLyricLine(LyricLine line) {
    return GestureDetector(
      onTap: line.hasInsight
          ? () => _showInsightPanel(line.insightId!, line.text)
          : null,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Text(
          line.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(line.hasInsight ? 1.0 : 0.6),
            fontSize: 20,
            fontWeight: line.hasInsight ? FontWeight.bold : FontWeight.w400,
            decoration: line.hasInsight
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationColor: AppColors.primaryOrange,
            decorationThickness: 2,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ),
    );
  }

  Widget _buildInsightTile(String user, String comment, int votes) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.anchor,
                      size: 14, color: AppColors.primaryOrange),
                  const SizedBox(width: 8),
                  Text(user,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              // THE NEW THUMBS UP SECTION
              GestureDetector(
                onTap: () {
                  // Logic to increment vote count in Postgres goes here
                  print("Voted for insight by $user");
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.oceanBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.thumb_up_off_alt_rounded,
                          size: 14, color: AppColors.oceanBlue),
                      const SizedBox(width: 6),
                      Text(
                        votes.toString(),
                        style: const TextStyle(
                          color: AppColors.oceanBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            comment,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.4,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Add your insight...',
          hintStyle: const TextStyle(color: Colors.white38),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.send_rounded,
              color: AppColors.primaryOrange, size: 20),
        ),
      ),
    );
  }
}
