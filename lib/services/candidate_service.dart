import 'package:matching_task/utilities/candidates.dart';

class CandidateService {
  static Future<List<Candidate>> fetchCandidates() async {
    // Simulate fetching data from an external source (API, database, etc.)
    await Future.delayed(const Duration(seconds: 2));
    // returning a list of Candidate object
    return [
      Candidate(
          name: "John Doe", kpis: ["Efficiency: 85%", "Satisfaction: 90%"]),
      Candidate(
          name: "Jane Smith", kpis: ["Efficiency: 78%", "Satisfaction: 95%"]),
      Candidate(
          name: "Alex Johnson", kpis: ["Efficiency: 92%", "Satisfaction: 88%"]),
    ];
  }
}
