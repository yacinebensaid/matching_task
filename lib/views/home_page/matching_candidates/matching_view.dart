import 'package:flutter/material.dart';
import 'package:matching_task/services/candidate_service.dart';
import 'package:matching_task/utilities/candidates.dart';

class MatchingButton extends StatefulWidget {
  const MatchingButton({Key? key}) : super(key: key);

  @override
  _MatchingButtonState createState() => _MatchingButtonState();
}

class _MatchingButtonState extends State<MatchingButton> {
  // the make of candidates list
  List<Candidate> candidates = [];

  @override
  void initState() {
    super.initState();
    // fetch candidates when the widget is initialized
    fetchCandidates();
  }

  // a method for fetching the data and passing it to the candidates list
  Future<void> fetchCandidates() async {
    List<Candidate> fetchedCandidates =
        await CandidateService.fetchCandidates();
    setState(() {
      candidates = fetchedCandidates;
    });
  }

  // I have chosen to display the candidate list in Dialog, I have tried to make the corners round and clean
  void showMatchedCandidates() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Matched Candidates',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(height: 16.0),
                  // Using ListView.builder for efficient building of the list
                  Expanded(
                    child: ListView.builder(
                      itemCount: candidates.length,
                      itemBuilder: (context, index) {
                        Candidate candidate = candidates[index];
                        return ListTile(
                          title: Text(candidate.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (String kpi in candidate.kpis) Text(kpi),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // the button with "Match" text on it which displays the Dialog
        ElevatedButton(
          onPressed: () {
            // Handle the "Match" button click
            showMatchedCandidates();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Match',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
