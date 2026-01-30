class Workout {
  final String date;
  final String bodyGroup;
  final String workoutType;
  final double workoutMins;
  final double breakMins;

  Workout({
    required this.date,
    required this.bodyGroup,
    required this.workoutType,
    required this.workoutMins,
    required this.breakMins,
  });

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
    date: json['date'],
    bodyGroup: json['bodyGroup'],
    workoutType: json['workoutType'],
    workoutMins: json['workoutMins'],
    breakMins: json['breakMins'],
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'bodyGroup': bodyGroup,
    'workoutType': workoutType,
    'workoutMins': workoutMins,
    'breakMins': breakMins,
  };
}
