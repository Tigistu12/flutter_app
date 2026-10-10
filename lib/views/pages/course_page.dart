import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/classes/activity_class.dart';
import 'package:http/http.dart' as http;

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Activity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const ActivityPage(),
    );
  }
}

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late Future<Activity> futureActivity;

  @override
  void initState() {
    super.initState();
    futureActivity = fetchActivity();
  }

  Future<Activity> fetchActivity() async {
    final response = await http.get(
      Uri.parse('https://bored-api.appbrewery.com/random'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;

      return Activity.fromJson(json);
    } else {
      throw Exception(
        'Failed to load activity: ${response.statusCode}',
      );
    }
  }

  void refreshActivity() {
    setState(() {
      futureActivity = fetchActivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Activity'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<Activity>(
          future: futureActivity,
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 50,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Error: ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: refreshActivity,
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Text('No activity found.');
            }

            final activity = snapshot.data!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Icon(
                          Icons.lightbulb_outline,
                          size: 60,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        activity.activity,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(height: 30),
                      buildDetail(
                        'Type',
                        activity.type,
                      ),
                      buildDetail(
                        'Availability',
                        '${activity.availability}',
                      ),
                      buildDetail(
                        'Participants',
                        '${activity.participants}',
                      ),
                      buildDetail(
                        'Price',
                        '${activity.price}',
                      ),
                      buildDetail(
                        'Accessibility',
                        activity.accessibility,
                      ),
                      buildDetail(
                        'Duration',
                        activity.duration,
                      ),
                      buildDetail(
                        'Kid Friendly',
                        activity.kidFriendly ? 'Yes' : 'No',
                      ),
                      buildDetail(
                        'Key',
                        activity.key,
                      ),
                      if (activity.link.isNotEmpty)
                        buildDetail(
                          'Link',
                          activity.link,
                        ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: refreshActivity,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Get Another Activity'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
