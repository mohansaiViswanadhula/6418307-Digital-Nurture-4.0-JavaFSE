import React from 'react';

const courses = [
  { id: 1, name: "Fullstack Development" },
  { id: 2, name: "ReactJS Advanced" },
  { id: 3, name: "NodeJS API Building" }
];

function CourseDetails() {
  return (
    <div>
      <h2>Course Details</h2>
      <ul>
        {courses.map((course) => (
          <li key={course.id}>{course.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default CourseDetails;
