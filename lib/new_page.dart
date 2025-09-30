
import 'package:flutter/material.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

/// Widget that allows selection of update track.
class TrackPicker extends StatelessWidget {
  const TrackPicker({super.key,
    required this.currentTrack,
    required this.onChanged,
  });

  final UpdateTrack currentTrack;

  final ValueChanged<UpdateTrack> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Update track:'),
        SegmentedButton<UpdateTrack>(
          segments: const [
            ButtonSegment(
              label: Text('Stable'),
              value: UpdateTrack.stable,
            ),
            ButtonSegment(
              label: Text('Beta'),
              icon: Icon(Icons.science),
              value: UpdateTrack.beta,
            ),
            ButtonSegment(
              label: Text('Staging'),
              icon: Icon(Icons.construction),
              value: UpdateTrack.staging,
            ),
          ],
          selected: {currentTrack},
          onSelectionChanged: (tracks) => onChanged(tracks.single),
        ),
      ],
    );
  }
}