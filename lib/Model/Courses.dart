// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
    Course({
        this.id,
        this.courseDepartment,
        this.courseName,
        this.subjectCode,
        this.createdAt,
    });

    int? id;
    String? courseDepartment;
    String? courseName;
    String? subjectCode;
    String? createdAt;

    Course copyWith({
        int? id,
        String? courseDepartment,
        String? courseName,
        String? subjectCode,
        String? createdAt,
    }) => 
        Course(
            id: id ?? this.id,
            courseDepartment: courseDepartment ?? this.courseDepartment,
            courseName: courseName ?? this.courseName,
            subjectCode: subjectCode ?? this.subjectCode,
            createdAt: createdAt ?? this.createdAt,
        );

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        courseDepartment: json["courseDepartment"],
        courseName: json["courseName"],
        subjectCode: json["subjectCode"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "courseDepartment": courseDepartment,
        "courseName": courseName,
        "subjectCode": subjectCode,
        "created_at": createdAt,
    };
}
