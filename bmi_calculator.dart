import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double _bmi = 0.0;
  String _category = '';
  String _dietPlan = '';
  String _exercisePlan = '';
  bool _showResult = false;

  void _calculateBMI() {
    // Get values from text fields
    String heightText = _heightController.text;
    String weightText = _weightController.text;

    // Check if fields are empty
    if (heightText.isEmpty || weightText.isEmpty) {
      _showError('Please enter both height and weight');
      return;
    }

    // Convert to numbers
    double height = double.tryParse(heightText) ?? 0;
    double weight = double.tryParse(weightText) ?? 0;

    // Check for valid numbers
    if (height <= 0 || weight <= 0) {
      _showError('Please enter valid positive numbers');
      return;
    }

    // Calculate BMI: weight (kg) / [height (m)]²
    double heightInMeters = height / 100; // Convert cm to meters
    double bmi = weight / (heightInMeters * heightInMeters);

    // Update state
    setState(() {
      _bmi = double.parse(bmi.toStringAsFixed(1)); // Round to 1 decimal
      _category = _getCategory(_bmi);
      _generateRecommendations(_bmi);
      _showResult = true;
    });
  }

  String _getCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal Weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Underweight':
        return Colors.orange;
      case 'Normal Weight':
        return Colors.green;
      case 'Overweight':
        return Colors.orange.shade700;
      case 'Obese':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _generateRecommendations(double bmi) {
    if (bmi < 18.5) {
      _dietPlan = '''
🥗 **Underweight Diet Plan:**
• Increase calorie intake by 300-500 calories/day
• Eat 5-6 small meals daily
• Include protein-rich foods (chicken, eggs, fish)
• Add healthy fats (avocado, nuts, olive oil)
• Drink weight gain shakes if needed
''';
      _exercisePlan = '''
🏋️ **Exercise for Underweight:**
• Strength training 3-4 times/week
• Focus on compound exercises
• Limit cardio to 2-3 times/week
• Get adequate rest between workouts
''';
    } else if (bmi < 25) {
      _dietPlan = '''
🥗 **Normal Weight Diet Plan:**
• Maintain balanced diet
• 3 main meals + 2 snacks
• Include all food groups
• Stay hydrated (2-3 liters water/day)
• Limit processed foods
''';
      _exercisePlan = '''
🏋️ **Exercise for Normal Weight:**
• 150 minutes moderate exercise/week
• Mix of cardio and strength
• Include flexibility training
• Stay active daily
''';
    } else if (bmi < 30) {
      _dietPlan = '''
🥗 **Overweight Diet Plan:**
• Reduce calories by 500/day
• High protein, moderate carbs
• Plenty of vegetables
• Avoid sugary drinks
• Eat slowly and mindfully
''';
      _exercisePlan = '''
🏋️ **Exercise for Overweight:**
• 300 minutes cardio/week
• Strength training 3 times/week
• Daily walking (10,000 steps)
• Consistency is key
''';
    } else {
      _dietPlan = '''
🥗 **Obese Diet Plan:**
• Consult doctor/nutritionist
• Significant calorie reduction
• High protein, low carb
• Regular meal patterns
• Professional guidance recommended
''';
      _exercisePlan = '''
🏋️ **Exercise for Obese:**
• Start with low-impact exercises
• Walking, swimming, cycling
• Gradual intensity increase
• Consider professional supervision
''';
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _clearFields() {
    _heightController.clear();
    _weightController.clear();
    setState(() {
      _showResult = false;
      _bmi = 0.0;
      _category = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Input Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Height Input
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height (cm)',
                        hintText: 'e.g., 175',
                        prefixIcon: const Icon(Icons.height),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Weight Input
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                        hintText: 'e.g., 70',
                        prefixIcon: const Icon(Icons.monitor_weight),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Calculate Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _calculateBMI,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'CALCULATE BMI',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Result Card (Only shows after calculation)
            if (_showResult) ...[
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // BMI Value with Color
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: _getCategoryColor(_category),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _bmi.toString(),
                                style: const TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'BMI',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Category
                      Text(
                        _category,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _getCategoryColor(_category),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // BMI Scale
                      _buildBMIScale(),

                      const SizedBox(height: 20),

                      // Close Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _clearFields,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            foregroundColor: Colors.black87,
                          ),
                          child: const Text('Clear & Calculate Again'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Diet Plan Card
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
                      Row(
                        children: [
                          const Icon(Icons.restaurant, color: Colors.blue),
                          const SizedBox(width: 10),
                          const Text(
                            'Diet Plan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _dietPlan,
                        style: const TextStyle(fontSize: 14, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Exercise Plan Card
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
                      Row(
                        children: [
                          const Icon(Icons.fitness_center, color: Colors.blue),
                          const SizedBox(width: 10),
                          const Text(
                            'Exercise Plan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _exercisePlan,
                        style: const TextStyle(fontSize: 14, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ] else if (_heightController.text.isNotEmpty ||
                _weightController.text.isNotEmpty) ...[
              // Show instruction if fields have text but no calculation
              Card(
                elevation: 2,
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(Icons.calculate, size: 50, color: Colors.grey),
                      SizedBox(height: 10),
                      Text(
                        'Enter height and weight above,\nthen click "CALCULATE BMI"',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBMIScale() {
    return Column(
      children: [
        const Text('BMI Categories:'),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildScaleItem('Underweight', '< 18.5', Colors.orange),
            _buildScaleItem('Normal', '18.5-24.9', Colors.green),
            _buildScaleItem('Overweight', '25-29.9', Colors.orange.shade700),
            _buildScaleItem('Obese', '≥ 30', Colors.red),
          ],
        ),
      ],
    );
  }

  Widget _buildScaleItem(String label, String range, Color color) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            range,
            style: const TextStyle(fontSize: 10),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
