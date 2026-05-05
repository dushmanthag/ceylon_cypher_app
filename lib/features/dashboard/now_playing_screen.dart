import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/lyric_line.dart';
import '../lyrics/widgets/lyric_view.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen>
    with SingleTickerProviderStateMixin {
  bool _showLyrics = false;
  bool _isPlaying = false;
  late AnimationController _playPauseController;

  // Sample Data for Testing
  final List<LyricLine> _sampleLyrics = [
    LyricLine(
        text: "පොඩි එකා වඩාගත්ත දැයේ පියා",
        hasInsight: true,
        insightId: "insight_001"),
    LyricLine(
      text: "Technical lyricism, every syllable at stake.",
      hasInsight: true,
      insightId: "insight_001",
    ),
    LyricLine(text: "Charting new waters where the legends relate,"),
    LyricLine(
      text: "In the depths of the verse, where the giants await.",
      hasInsight: true,
      insightId: "insight_002",
    ),
    LyricLine(text: "Drop anchor in the harbor of a heavy weight."),
  ];

  @override
  void initState() {
    super.initState();
    // Animation duration for the play/pause morphing effect
    _playPauseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _playPauseController.dispose();
    super.dispose();
  }

  void _handlePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying
          ? _playPauseController.forward()
          : _playPauseController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.expand_more, color: Colors.white, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('CURRENT VOYAGE',
            style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5)),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Toggleable Main Content (Art or Lyrics)
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: _showLyrics
                    ? LyricView(lyrics: _sampleLyrics)
                    : _buildCoverArt(),
              ),
            ),

            const SizedBox(height: 24),
            _buildTrackInfo(),
            const SizedBox(height: 24),
            _buildProgressBar(context),
            const SizedBox(height: 24),
            _buildPlaybackControls(),
            const SizedBox(height: 24),
            _buildBottomUtils(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverArt() {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 30,
              offset: const Offset(0, 20),
            ),
          ],
          image: const DecorationImage(
            image: NetworkImage('https://picsum.photos/600/600?random=42'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTrackInfo() {
    return Column(
      children: [
        const Text(
          'The Atlantic Crossing',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'SONICSTREAM ORIGINAL',
          style: TextStyle(
              color: AppColors.oceanBlue,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 4),
            activeTrackColor: AppColors.primaryOrange,
            inactiveTrackColor: Colors.white10,
            thumbColor: Colors.white,
          ),
          child: Slider(value: 0.4, onChanged: (v) {}),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1:42', style: TextStyle(color: Colors.grey, fontSize: 10)),
              Text('3:58', style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlaybackControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.shuffle),
          color: Colors.grey,
          iconSize: 20,
          onPressed: () => print("Shuffle toggled"),
        ),
        IconButton(
          icon: const Icon(Icons.skip_previous_rounded),
          color: Colors.white,
          iconSize: 40,
          onPressed: () => print("Previous Track"),
        ),

        // THE ANIMATED PLAY/PAUSE BUTTON
        GestureDetector(
          onTap: _handlePlayPause,
          child: Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _playPauseController,
                color: AppColors.deepNavy,
                size: 32,
              ),
            ),
          ),
        ),

        IconButton(
          icon: const Icon(Icons.skip_next_rounded),
          color: Colors.white,
          iconSize: 40,
          onPressed: () => print("Next Track"),
        ),
        IconButton(
          icon: const Icon(Icons.repeat),
          color: Colors.grey,
          iconSize: 20,
          onPressed: () => print("Repeat toggled"),
        ),
      ],
    );
  }

  Widget _buildBottomUtils() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.devices, color: Colors.grey, size: 20),

        // LYRICS TOGGLE BUTTON
        GestureDetector(
          onTap: () => setState(() => _showLyrics = !_showLyrics),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _showLyrics ? AppColors.oceanBlue : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              children: [
                Icon(Icons.mic_external_on_outlined,
                    size: 16, color: _showLyrics ? Colors.white : Colors.grey),
                const SizedBox(width: 4),
                Text('LYRICS',
                    style: TextStyle(
                        color: _showLyrics ? Colors.white : Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),

        const Icon(Icons.share_outlined, color: Colors.grey, size: 20),
      ],
    );
  }
}
