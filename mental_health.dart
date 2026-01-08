import 'package:flutter/material.dart';

class MentalHealthPage extends StatelessWidget {
  const MentalHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mental Wellness',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mental Health Support',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Professional advice and self-care strategies for mental well-being',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            _buildMentalHealthCard(
              '😔 Depression',
              Icons.mood_bad,
              '''
📝 Strategies:
• Practice regular physical activity (30 min daily)
• Maintain social connections
• Establish daily routine
• Seek professional help
• Practice mindfulness meditation (10 min daily)
• Limit social media use
• Get sunlight exposure (15 min morning sun)
• Set small achievable goals
• Keep gratitude journal
• Consider therapy or counseling

💊 Professional Help:
• Consult psychiatrist if symptoms persist
• Consider medication if prescribed
• Regular therapy sessions
• Join support groups
''',
              Colors.orange.shade100,
            ),
            _buildMentalHealthCard(
              '😰 Anxiety',
              Icons.psychology,
              '''
🧘‍♂️ Calming Techniques:
• Deep breathing exercises (4-7-8 technique)
• Progressive muscle relaxation
• Limit caffeine intake
• Practice grounding techniques (5-4-3-2-1 method)
• Regular exercise routine
• Adequate sleep schedule (7-9 hours)
• Challenge negative thoughts
• Seek therapy if needed

🌿 Natural Remedies:
• Chamomile tea
• Lavender essential oil
• Magnesium supplements
• Regular exercise
• Meditation practice
''',
              Colors.purple.shade100,
            ),
            _buildMentalHealthCard(
              '😴 Poor Sleep Schedule',
              Icons.nightlight_round,
              '''
🌙 Sleep Hygiene:
• Consistent sleep schedule (same bedtime/waketime)
• Avoid screens 1 hour before bed
• Create relaxing bedtime routine
• Comfortable sleep environment (cool, dark, quiet)
• Limit daytime naps (max 20 minutes)
• Avoid heavy meals before bed
• Regular exercise (not too close to bedtime)
• Reduce caffeine in evening

🛌 Sleep Tips:
• Bedroom for sleep only
• 20-minute rule: If not asleep, get up
• Limit liquids before bedtime
• Consider white noise
• Try relaxation techniques
''',
              Colors.blue.shade100,
            ),
            _buildMentalHealthCard(
              '😫 Stress Management',
              Icons.self_improvement,
              '''
🎯 Stress Reduction:
• Regular physical activity
• Time management skills
• Learn to say no
• Practice relaxation techniques
• Maintain work-life balance
• Healthy eating habits
• Social support network
• Professional counseling

🧠 Mindfulness Practices:
• Daily meditation
• Yoga or tai chi
• Deep breathing exercises
• Journaling thoughts
• Mindful walking
• Digital detox periods
''',
              Colors.green.shade100,
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Emergency Resources',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'If you\'re in crisis or experiencing suicidal thoughts, please contact emergency services immediately or call a crisis helpline.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'National Suicide Prevention Lifeline: 1-800-273-8255',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Crisis Text Line: Text HOME to 741741',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMentalHealthCard(
      String title, IconData icon, String content, Color color) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.blue),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
