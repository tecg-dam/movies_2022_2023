import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:movies/cards/single_media_picture.dart';
import 'package:movies/models/media.dart';
import 'package:movies/screens/single_media.dart';
import 'package:movies/styles/constants.dart';

import 'media_rate.dart';

@immutable
class MediaCard extends StatefulWidget {
  final Media media;
  final bool isLast;
  final String type;

  const MediaCard({required this.media, this.isLast = false, Key? key, required this.type})
      : super(key: key);

  @override
  State<MediaCard> createState() => _MediaCardState();
}

class _MediaCardState extends State<MediaCard> {
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('fr');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleMedia(media: widget.media, type:widget.type)));
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: kDefaultSpacer, right: widget.isLast ? kDefaultSpacer : 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: kVerticalSpacer),
                child: SingleMediaPicture(path: widget.media.posterPath),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: kDefaultSpacer,
                  ),
                  MediaRate(voteAverage: widget.media.voteAverage),
                ],
              )
            ],
          ),
          Hero(
            tag: widget.media.title,
            child: Text(
              widget.media.title,
              softWrap: true,
              maxLines: 2,
              style: kCardTitleStyle.apply(color: kMainTextColor),
            ),
          ),
          const SizedBox(height: kVerticalSpacer / 8),
          Text(
            dateFormat.format(widget.media.releaseDate),
            style: kCardSubtitleStyle.apply(color: kMainTextColor),
            textAlign: TextAlign.left,
          )
        ]),
      ),
    );
  }
}
