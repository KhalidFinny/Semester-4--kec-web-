#import "@preview/basic-resume:0.1.0": *

#let name = "Muhammad Khalid Atthoriq"
#let location = "Malang City, East Java"
#let email = "katthoriq@gmail.com"
#let github = "khalidatthoriq.vercel.app"
#let linkedin = "linkedin.com/in/khalidatthoriq"
#let phone = "+62 812-3040-0332"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  accent-color: "#000000",
)

== Skills
- *Video Editing Tools*: Adobe Premiere Pro, Adobe After Effects, CapCut 
- *Design Tools*: Figma, Canva
- *Interests*: Automotive, Cats

== Experiences
#extracurriculars(
  activity: "Workshop Riset Informatika",
  dates: dates-helper(start-date: "February 2024", end-date: "Present"),
)
- Creative Team Leader since February 2025
- Creative Team acting leader from September 2024 until February 2025.
- Lead Video Editor for Workshop Riset Informatika.
- Responsible for the organization social media account.
  - Help to create the instagram account design system.
  - Main Editor for Workshop Riset Informatika's Youtube Channel.

#extracurriculars(
  activity: "Freelance Videographer",
  dates: dates-helper(start-date: "August 2022", end-date: "August 2024"),
)
- Responsible for Turun Tangan Malang video documentation on Ruang Sinau 7.
- Helping clients create good quality video content.
- Turn ideas into real life implementations.
- Helping clients create video content for their social media.
-  
== Projects

#project(
  role: "Videographer",
  name: "Workshop Riset Informatika",
  dates: dates-helper(start-date: "October 2023", end-date: "January 2025"),
  url: "youtube.com/@workshoprisetinformatika",
)
// - Analyzed the clients need by doing interview and field observation
// - Provided full documentation needed for the application development
// - Helped in conducting progress meeting
// - Developed decision support system for goverment grant
// - Developed website using Laravel
// - Constructed database using relational database management system
- Videographer leader for all of Workshop Riset Informatika's events.
- Coordinator for every documentation process.
- Main video editor for every Aftermovies.
- Responsible for Workshop Riset Informatika's Youtube Channel.

#project(
  role: "Videographer",
  name: "Ruang Sinau 7",
  dates: dates-helper(start-date: "March 2023", end-date: "April 2023"),
  url: "instagram.com/turuntanganmlg",
)
// - Analyzed the clients need by doing interview and field observation
// - Provided full documentation needed for the application development
// - Helped in conducting progress meeting
// - Developed decision support system for goverment grant
// - Developed website using Laravel
// - Constructed database using relational database management system
- Record documentation for the Ruang Sinau 7 volunteering project.
- Responsible fot creating Aftermovies.
- Coordinate camera positions for the best footage possible.
  

== Education

#edu(
  institution: "Politeknik Negeri Malang",
  location: "Malang City, East Java",
  dates: dates-helper(start-date: "Aug 2023", end-date: "2027"),
  degree: "Bachelor's of Applied Science, Informatics Engineering",
)
- Cumulative GPA: 3.7\/4.0
- Member of Workshop Riset Informatika
// - Relevant Coursework: Data Structures, Program Development, Microprocessors, Abstract Algebra I: Groups and Rings, Linear Algebra, Discrete Mathematics, Multivariable & Single Variable Calculus, Principles and Practice of Comp Sci

#edu(
  institution: "SMA Negeri 1 Lawang",
  location: "Malang City, East Java",
  dates: dates-helper(start-date: "2019", end-date: "2022"),
  degree: "High School Diploma",
)
- Member of Gema Theater

== Languages
- *Indonesian* : Native
- *English* : C2