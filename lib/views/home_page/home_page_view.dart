import 'package:flutter/material.dart';
import 'package:matching_task/views/home_page/matching_candidates/matching_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //the appbar can be made in a separated file, I'm putting it here for the meanwhile because it does not contain any tools
        appBar: AppBar(
          title: const Text('Matched Candidates'),
        ),
        backgroundColor: Colors.white,
        body: const Center(
          child: MatchingButton(),
        ));
  }
}
