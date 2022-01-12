import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage(
      {Key? key,
      required this.appName,
      required this.developerName,
      required this.rating,
      required this.downloads,
      required this.screenShots,
      required this.appDescription,
      required this.reviews,
      required this.buttons,
      s})
      : super(key: key);

  final String appName;
  final String developerName;
  final double rating;
  final double reviews;
  final double downloads;
  final List<String> screenShots;
  final String appDescription;
  final List<Widget> buttons;

  String convertNumber(double number) {
    return NumberFormat.compact().format(number);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Material(
        child: ListView(
          padding: const EdgeInsets.only(top: 100),
          shrinkWrap: true,
          children: [
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appName,
                    style:
                        Theme.of(context).primaryTextTheme.headline3?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    developerName,
                    style:
                        Theme.of(context).primaryTextTheme.headline6?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Highligths(
                          title: '$rating ⭐',
                          text: '${convertNumber(reviews)} Reveiws'),
                      const VerticalDivider(),
                      Highligths(
                          title: convertNumber(downloads), text: 'Downloads'),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: buttons,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: screenShots
                          .map((e) => PlayStoreScreenShot(
                                image: e,
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          top: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          'About this app ',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline5
                              ?.copyWith(),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_outlined)
                    ],
                  ),
                  Text(
                    appDescription,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subtitle1
                        ?.copyWith(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      tablet: Material(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 100),
          shrinkWrap: true,
          children: [
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appName,
                    style:
                        Theme.of(context).primaryTextTheme.headline3?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    developerName,
                    style:
                        Theme.of(context).primaryTextTheme.headline6?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Highligths(
                          title: '$rating ★',
                          text: '${convertNumber(reviews)} Reveiws'),
                      const VerticalDivider(),
                      Highligths(
                          title: convertNumber(downloads), text: 'Downloads'),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: buttons,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: screenShots
                          .map((e) => PlayStoreScreenShot(
                                image: e,
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          top: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          'About this app ',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline5
                              ?.copyWith(),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_outlined)
                    ],
                  ),
                  Text(
                    appDescription,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subtitle1
                        ?.copyWith(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Highligths extends StatelessWidget {
  const Highligths({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(title),
          Text(text),
        ],
      ),
    );
  }
}

class PlayStoreScreenShot extends StatelessWidget {
  const PlayStoreScreenShot({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 180,
        child: AspectRatio(
          aspectRatio: 10 / 21,
          child: Image.asset(image),
        ),
      ),
    );
  }
}
