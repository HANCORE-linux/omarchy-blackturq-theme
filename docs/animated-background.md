# Optional particle-wave background

`backgrounds/blackturq-motion-loop.mp4` adds a turquoise particle-wave animation
that matches the Black Turq palette. It is an optional background; the existing
still images and theme settings remain available.

## Media details

| Property | Value |
| --- | --- |
| Container / codec | MP4 / H.264 |
| Pixel format | 8-bit YUV 4:2:0 |
| Frame size | 2048 × 1280, 16:10 |
| Frame rate | 60 fps |
| Duration | 11.5 seconds, 690 frames |
| Audio | None |
| File size | 78,593,058 bytes (about 75 MiB) |

The source is a 1280 × 720 Gemini-generated video supplied by the contributor.
This export is upscaled, rather than native 4K. Processing includes optical-flow
interpolation, a motion-aligned overlap, retiming to reduce the source's ending
slowdown, and luminance sharpening. The transition was checked for continuous
frame timestamps and the complete video was decoded without errors. A visual
judgment of the loop can depend on the playback engine and display.

The Git asset contains one cycle. A wallpaper player repeats it; duplicating
many cycles inside the repository would unnecessarily multiply the download.

## Motion processing

The original clip contains 240 frames at 24 fps. Its last 12 frames are
motion-aligned with its first 12 frames and combined using a raised-cosine
overlap. The base loop starts at source frame 12, so the incoming motion at the
end of the overlap continues naturally into the next cycle. Frame numbers here
are zero-based.

Motion estimation uses OpenCV's medium-preset DIS optical flow in both
directions, calculated at 640×360 and scaled back to the source dimensions.
Both images are warped toward one another with cubic sampling before blending,
reducing doubled particle patterns during the transition.

A circular, smoothed time map based on the wave's measured movement compensates
for the source's slower ending. The map was refined using measurements of the
rendered output. Sampling it into 690 frames produces the 11.5-second cycle at
60 fps. Fractional positions use motion-compensated interpolation between
neighboring frames; the motion always moves forward.

The final export applies luminance sharpening before and after Lanczos scaling,
then mild contrast and saturation adjustments. H.264 encoding uses x264's
`medium` preset, CRF 12, `yuv420p`, and MP4 `+faststart`. The source is scaled to
2276×1280, then center-cropped to 2048×1280. These effects are already baked
into the video; playback needs no custom processing script.

## Select the background

Use an Omarchy version with video-background support and a working video
wallpaper renderer, such as OWE. After installing this theme:

```bash
omarchy theme bg set "$HOME/.config/omarchy/themes/blackturq/backgrounds/blackturq-motion-loop.mp4"
```

Video rendering can use more GPU power than a still background. The display
may crop the 16:10 video to fit another aspect ratio.

## Optional longer playback file

Some players briefly hesitate when seeking from the end of a file to its start.
To reduce how often the player reaches that boundary, create a local file with
twelve consecutive copies of the loop:

```bash
mkdir -p "$HOME/Videos"

ffmpeg -stream_loop 11 \
  -i "$HOME/.config/omarchy/themes/blackturq/backgrounds/blackturq-motion-loop.mp4" \
  -map 0:v:0 -an -c copy -movflags +faststart \
  "$HOME/Videos/blackturq-motion-extended.mp4"

omarchy theme bg set "$HOME/Videos/blackturq-motion-extended.mp4"
```

The output is 138 seconds long and
about 943 MB. Stream copy preserves the encoded image quality. The same cycle
plays every 11.5 seconds, while the actual end-of-file seek occurs once every
138 seconds. It can still pause at that final boundary, depending on the player.

## Provenance

The animation was generated using Google Gemini and edited for this contribution
by Zane Ramsey with Codex assistance. HANCORE's Black Turq theme provides the
palette and theme context. The contribution does not change the theme's license.
