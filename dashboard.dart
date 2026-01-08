import 'package:flutter/material.dart';
import 'bmi_calculator.dart';
import 'mental_health.dart';
import 'feedback_page.dart';
import 'profile.dart'; // Add this import

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HealthFit Pro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Color(0xFF1976D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to Your',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Health Journey!',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Track your fitness, monitor your health, and achieve your goals with our comprehensive wellness platform.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withAlpha(230),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Health Information
            const Text(
              'Health & Fitness Guide',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 15),
            _buildInfoCard(
              context,
              'Physical Fitness',
              'Exercise recommendations and workout plans tailored to different fitness levels and goals.',
              Icons.fitness_center,
              Colors.orange.shade100,
              Colors.orange,
            ),
            _buildInfoCard(
              context,
              'Nutrition',
              'Personalized diet plans for weight management, muscle gain, and overall health.',
              Icons.restaurant,
              Colors.green.shade100,
              Colors.green,
            ),
            _buildInfoCard(
              context,
              'Mental Wellness',
              'Strategies for stress management, better sleep, and improved mental health.',
              Icons.psychology,
              Colors.purple.shade100,
              Colors.purple,
            ),
            _buildInfoCard(
              context,
              'Heart Health',
              'Cardiovascular care tips, heart-friendly exercises, and dietary recommendations.',
              Icons.favorite,
              Colors.red.shade100,
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Color(0xFF1976D2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(height: 10),
                const Text(
                  'HealthFit Pro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Your Health Companion',
                  style: TextStyle(
                    color: Colors.white.withAlpha(200),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.blue),
            title: const Text('Dashboard'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.calculate, color: Colors.blue),
            title: const Text('BMI Calculator'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BMICalculator()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.psychology, color: Colors.blue),
            title: const Text('Mental Health'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MentalHealthPage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.feedback, color: Colors.blue),
            title: const Text('Feedback'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FeedbackPage()),
            ),
          ),
          // User Database - Using Icons.storage instead
          ListTile(
            leading: const Icon(Icons.storage, color: Colors.blue),
            title: const Text('User Database'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoCard(
  BuildContext context,
  String title,
  String content,
  IconData icon,
  Color bgColor,
  Color iconColor,
) {
  return GestureDetector(
    onTap: () {
      if (title == 'Physical Fitness') {
        _showPhysicalFitnessSuggestions(context);
      } else if (title == 'Nutrition') {
        _showNutritionSuggestions(context);
      } else if (title == 'Mental Wellness') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MentalHealthPage()),
        );
      } else if (title == 'Heart Health') {
        _showHeartHealthSuggestions(context);
      }
    },
    child: Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor),
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
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    ),
  );
}

void _showPhysicalFitnessSuggestions(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Physical Fitness Recommendations'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSuggestionSection('🏋️‍♂️ For Beginners:', '''
• 30 minutes brisk walking, 5 days/week
• Bodyweight exercises: 3 sets of 10 reps
• Stretching: 10 minutes daily
• Rest: 1-2 days between workouts
'''),
            _buildSuggestionSection('💪 Intermediate Level:', '''
• Cardio: 30-45 minutes, 5 days/week
• Strength training: 3-4 times weekly
• Include: Squats, push-ups, lunges
• Add: Yoga or Pilates 2 times/week
'''),
            _buildSuggestionSection('🏆 Advanced Level:', '''
• HIIT: 20-30 minutes, 4 times/week
• Weight training: 5-6 times/week
• Sports activities: 2 times/week
• Active recovery: 1 day/week
'''),
            _buildSuggestionSection('👨‍🦳 For Seniors:', '''
• Low-impact cardio: 30 minutes daily
• Balance exercises: 10 minutes/day
• Strength: Light weights, 2 times/week
• Flexibility: Daily stretching
'''),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

void _showNutritionSuggestions(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Nutrition & Diet Plans'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSuggestionSection('⚖️ For Weight Loss:', '''
• Calorie deficit: 500 calories/day
• Protein: 30% of daily calories
• Complex carbs: Whole grains, vegetables
• Healthy fats: Avocado, nuts, olive oil
• 5-6 small meals daily
• Drink 2-3 liters water
'''),
            _buildSuggestionSection('📈 For Weight Gain:', '''
• Calorie surplus: 300-500 calories/day
• Protein: 1.6-2.2g per kg body weight
• Healthy carbs: Rice, potatoes, oats
• Nutritious snacks between meals
• Weight gain shakes if needed
• Regular meal timing
'''),
            _buildSuggestionSection('⚖️ For Weight Maintenance:', '''
• Balanced macronutrients
• Regular meal schedule
• Portion control
• Variety of fruits/vegetables
• Limit processed foods
• Stay hydrated
'''),
            _buildSuggestionSection('💪 For Muscle Building:', '''
• High protein: Chicken, fish, eggs
• Complex carbs pre/post workout
• Healthy fats for hormones
• 5-6 meals spaced evenly
• Post-workout nutrition within 1 hour
• Adequate hydration
'''),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

void _showHeartHealthSuggestions(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Heart Health Recommendations'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSuggestionSection('❤️ Heart-Healthy Diet:', '''
• Omega-3 fatty acids: Salmon, walnuts
• Fiber: Oats, beans, fruits
• Antioxidants: Berries, dark chocolate
• Limit: Salt, sugar, saturated fats
• Increase: Vegetables, whole grains
• Choose: Lean proteins
'''),
            _buildSuggestionSection('🏃‍♂️ Cardiovascular Exercise:', '''
• Brisk walking: 30 minutes daily
• Cycling: 20-30 minutes, 3 times/week
• Swimming: 30 minutes, 2-3 times/week
• Moderate intensity: Maintain conversation
• Progress gradually
• Monitor heart rate
'''),
            _buildSuggestionSection('🚫 Avoid:', '''
• Smoking and tobacco
• Excessive alcohol
• High sodium foods
• Trans fats
• Sedentary lifestyle
• Chronic stress
'''),
            _buildSuggestionSection('📊 Regular Monitoring:', '''
• Blood pressure: Monthly check
• Cholesterol: Every 6 months
• Blood sugar: Regular screening
• Weight: Weekly tracking
• Report symptoms immediately
• Regular doctor visits
'''),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

Widget _buildSuggestionSection(String title, String content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.blue,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        content,
        style: const TextStyle(fontSize: 14),
      ),
      const SizedBox(height: 15),
    ],
  );
}
