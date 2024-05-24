import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerRatingPage extends StatefulWidget {
  const CustomerRatingPage({super.key});

  @override
  _CustomerRatingPageState createState() => _CustomerRatingPageState();
}

class _CustomerRatingPageState extends State<CustomerRatingPage> {
  TextEditingController _feedbackController = TextEditingController();
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Your Experience'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Rate our service:'),
            Slider(
              value: _rating,
              onChanged: (newRating) {
                setState(() {
                  _rating = newRating;
                });
              },
              min: 0,
              max: 5,
              divisions: 5,
              label: _rating.toString(),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _feedbackController,
              decoration: const InputDecoration(
                labelText: 'Feedback (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                submitRating();
              },
              child: const Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }

  void submitRating() async {
    try {
      await FirebaseFirestore.instance.collection('ratings').add({
        'rating': _rating,
        'feedback': _feedbackController.text,
        'timestamp': Timestamp.now(),
      });
      // Optionally, show a confirmation dialog or navigate to a new screen.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Thank you for your feedback!'),
      ));
    } catch (e) {
      print('Error submitting rating: $e');
      // Handle error
    }
  }
}
