import 'package:carousel_slider/carousel_slider.dart';
import 'package:empowher/application/time_ui/time_ui_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';
import '../../style/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bg,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Style.lightPink1,
        shadowColor: Colors.pink.withOpacity(.3),
        centerTitle: true,
        title: Shimmer.fromColors(
          highlightColor: Style.lightPink,
          baseColor: Style.blushPink,
          child: RichText(
            text: const TextSpan(
              text: "Empow",
              style: TextStyle(fontSize: 22),
              children: [
                TextSpan(
                    text: "Her", style: TextStyle(fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_outlined,
              color: Style.peachyPink,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Stories(
                circlePadding: .3,
                circleRadius: MediaQuery.sizeOf(context).width * 0.082,
                storyItemList: [
                  StoryItem(
                    name: 'Sevara',
                    thumbnail: const NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5OEBamrwmo0HT3txKwEe-QDgqWnUx_QARTww8lgM0GA&s"),
                    stories: [],
                  ),
                  StoryItem(
                    name: 'Sevara',
                    thumbnail: const NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5OEBamrwmo0HT3txKwEe-QDgqWnUx_QARTww8lgM0GA&s"),
                    stories: [],
                  ),
                  StoryItem(
                    name: 'Sevara',
                    thumbnail: const NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5OEBamrwmo0HT3txKwEe-QDgqWnUx_QARTww8lgM0GA&s"),
                    stories: [],
                  ),
                  StoryItem(
                    name: 'Sevara',
                    thumbnail: const NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5OEBamrwmo0HT3txKwEe-QDgqWnUx_QARTww8lgM0GA&s"),
                    stories: [],
                  ),
                  StoryItem(
                    name: 'Sevara',
                    thumbnail: const NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5OEBamrwmo0HT3txKwEe-QDgqWnUx_QARTww8lgM0GA&s"),
                    stories: [],
                  ),
                  StoryItem(
                    name: 'Sevara',
                    thumbnail: const NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5OEBamrwmo0HT3txKwEe-QDgqWnUx_QARTww8lgM0GA&s"),
                    stories: [],
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EVENTS",
                          style: TextStyle(
                              color: Style.peachyPink,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'SEE ALL',
                          style: TextStyle(
                              color: Style.peachyPink.withOpacity(.6)),
                        )
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: 5,
                    options: CarouselOptions(
                        autoPlay: true,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        enlargeCenterPage: true,
                        enlargeFactor: .2),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 3,
                                color: Style.lightPink1,
                              )
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Meet up",
                                      style: TextStyle(
                                        color: Style.blushPink,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.mic,
                                          color: Style.peachyPink,
                                          size: 15,
                                        ),
                                        Text(
                                          'Mashhura',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Style.peachyPink
                                                  .withOpacity(.9),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          color: Style.peachyPink,
                                          size: 15,
                                        ),
                                        Text(
                                          '15:00',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Style.peachyPink
                                                  .withOpacity(.9),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Style.peachyPink,
                                          size: 15,
                                        ),
                                        Text(
                                          'Tashkent',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Style.peachyPink
                                                  .withOpacity(.9),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                top: Radius.circular(10),
                                              ),
                                              color: Style.peachyPink,
                                            ),
                                            padding: const EdgeInsets.all(1),
                                            child: const FittedBox(
                                              child: Text(
                                                "February",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                bottom: Radius.circular(10),
                                              ),
                                              color: Style.lightPink1,
                                            ),
                                            padding: const EdgeInsets.all(5),
                                            child: FittedBox(
                                              child: Text(
                                                "29",
                                                style: TextStyle(
                                                    color: Style.peachyPink),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: BlocProvider(
                                  create: (context) => TimeUiBloc(),
                                  child: BlocBuilder<TimeUiBloc, TimeUiState>(
                                    builder: (context, state) {
                                      context
                                          .read<TimeUiBloc>()
                                          .add(const TimeUiEvent.changeState());
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: (DateTime.now().hour < 19 &&
                                                  DateTime.now().hour > 5)
                                              ? Colors.blue.shade200
                                              : const Color(0xff003366)
                                                  .withOpacity(.6),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            if (!(DateTime.now().hour < 19 &&
                                                DateTime.now().hour > 5))
                                              const Icon(
                                                Icons.dark_mode_outlined,
                                                color: Colors.white,
                                                size: 50,
                                              ),
                                            Column(
                                              children: [
                                                Text(
                                                  DateFormat('hh:mm')
                                                      .format(DateTime.now()),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  DateFormat('EEEE')
                                                      .format(DateTime.now()),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          Colors.green.shade300.withOpacity(.6),
                                    ),
                                    padding: const EdgeInsets.all(20),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: FittedBox(
                                                child: Text(
                                                  'Tashkent',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'safe location',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red.withOpacity(.7),
                                    ),
                                    padding: const EdgeInsets.all(20),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.sos,
                                          color: Colors.white,
                                          size: 45,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
