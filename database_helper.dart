import 'package:flutter/material.dart';

class DatabaseHelper {
  // Simple in-memory list to store users (for testing/demo)
  static List<Map<String, dynamic>> _users = [];
  static List<Map<String, dynamic>> _feedback = [];

  // Fake initialization that always works
  Future<void> initializeDatabase() async {
    await Future.delayed(const Duration(milliseconds: 500));
    debugPrint('✅ Database initialized (in-memory)');
  }

  Future<Database> get database async {
    await initializeDatabase();
    return Database._();
  }

  // User operations
  Future<int> insertUser(Map<String, dynamic> user) async {
    await Future.delayed(
        const Duration(milliseconds: 500)); // Simulate DB delay
    final newUser = {
      ...user,
      'id': _users.length + 1,
      'created_at': DateTime.now().toString(),
    };
    _users.add(newUser);
    debugPrint('✅ User added: ${user['email']} (Total: ${_users.length})');
    return _users.length;
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    await Future.delayed(const Duration(milliseconds: 300));
    for (var user in _users) {
      if (user['email'] == email) {
        debugPrint('✅ User found: $email');
        return user;
      }
    }
    debugPrint('❌ User not found: $email');
    return null;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_users);
  }

  // Feedback operations
  Future<int> insertFeedback(Map<String, dynamic> feedback) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final newFeedback = {
      ...feedback,
      'id': _feedback.length + 1,
      'date': DateTime.now().toString(),
    };
    _feedback.add(newFeedback);
    return _feedback.length;
  }

  Future<List<Map<String, dynamic>>> getAllFeedback() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_feedback);
  }

  // BMI History (simplified)
  Future<int> insertBMIHistory(Map<String, dynamic> bmiData) async {
    await Future.delayed(const Duration(milliseconds: 500));
    debugPrint('✅ BMI saved: ${bmiData['bmi_value']}');
    return 1;
  }

  Future<List<Map<String, dynamic>>> getBMIHistory(int userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return []; // Empty list for now
  }

  // Reset
  Future<void> resetDatabase() async {
    _users.clear();
    _feedback.clear();
    debugPrint('🔄 Database cleared');
  }
}

// Dummy Database class to satisfy type checks
class Database {
  Database._();
}
