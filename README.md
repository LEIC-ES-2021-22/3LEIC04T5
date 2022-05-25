# 3LEIC04T5 | Team name: UC Info
# General Information
## Group Members
| **Student Name** | **Student Number** |
| ------------ | -------------- |
| Afonso Carvalho  | up201807481 |
| Benedita Bacelar | up201909937 |
| Fábio Rocha      | up202005478 |
| Ricardo Pinto    | up201806849 |
| Tiago Lourenço   | up202004374 |
# Product Name: UC Info
## Vision Stament
For all students who currently can't easily find all the information they need about their disciplines, UCInfo is an app that gathers all the relevant parts of it in one easily accessible place.<br>
Unlike the current scattered and overly complex sources of this information, UCInfo delivers only the necessary information, on a mobile experience and with an extremely intuitive user experience.

## Elevator Pitch
UCInfo is a way to access all the essential information about your courses fast and on your phone.<br>
With it, students will never miss exam dates, grading criteria or any other must-know piece of information about the courses they’re enrolled in.<br>
All while avoiding the need to open their laptops, signing into sigarra and having to spend time until finding the right page or sifting through unnecessary information for what you want. 


## Main Features
#### Curricular Unit Information Features
- **1.1)** Having a dedicated page for each Curricular Unit
- **1.2)** Displaying the CU's information organized by headings such as assessment components, exam eligibility, grade formula, and others.


#### Calendar
- **2.1)** Seamless integration of Moodle calendar with the app
- **2.2)** Ability to add in-app calendar events to third-party calendar services, such as Google Calendar or Apple Calendar


#### Notifications
- **3.1)** Notification dashboard with relevant information additions, modifications or deletions.
- **3.2)** Ability to send push notifications to user regarding 

​
​
## Required API's
- Sigarra API
- Moodle API
- External Calendar APIs
  - Google API
  - Apple API
 


## Requirements

## Use Cases
![image](https://user-images.githubusercontent.com/3297993/159724623-52fcf69d-dbd1-414b-9bf9-7e37bac69495.png)


| *Name* | View Courses Information |
| ------ | ------------------------ |
| *Actor* |  Student | 
| *Description* | The student views grading criteria, exam eligibility and other crucial information about each specific course |
| *Preconditions* | - The student is enrolled in the courses he wants to view <br> - The student is logged in into their sigarra account. |
| *Normal flow* | 1. The student accesses the UNI mobile app.<br> 2. The system shows the list of courses the student is enrolled in.<br> 3. The student selects the curricular unit he/she wants to see details for.<br> 4. A new page displaying the grading criteria, classification formula, required bibliography and other key informations is displayed.

<br>

| *Name* | Integrated Moodle Calendar |
| --- | --- |
| *Actor* |  Student | 
| *Description* | The student has the events from his or her moodle calendar pulled and integrated into a calendar in the app |
| *Preconditions* | - The student is enrolled in the courses he wants to get calendar information from <br> - The student is logged in into their moodle account. |
| *Normal flow* | 1. The student accesses an in-app calendar page<br> 2. The system shows the list of events such as delivery dates or exam dates inside the calendar.<br> 3. The student can select one of these events leading him/her to the respective curricular unit page. |

<br>

| *Name* | Notification Dashboard |
| --- | --- |
| *Actor* |  Student |
| *Description* | The student is able to view important notifactions regarding each one of his/her enrolled courses, such as exam date and time changes or new moodle entry in "Alerts" section, for example.|
| *Preconditions* | - The student is enrolled in the courses he wishes to receive notifications from. |
| *Postconditions* | - Notifications viewed by the student are followed up or/and dismissed by the student. |
| *Normal flow* | 1. The student logs in to the UNI app, and is informed he/she has new unseen notifications.<br>2. The student clicks the notification icon and a pop-up or page displays unseen notifications.<br>3. The student is able to read the notification and optionally click on it and be redirected to the relevant page.<br>4. The student is able to dismiss any single notification from the notification dashboard, or dismiss all notifications at once.<br>5. Student exits notification dashboard and is redirected to the last visited page (or static page such as main screen) |
| *Alternative flows and exceptions* | 1. Student has no new/unread notification, and is displayed a "No new notification" message. |

<br>

| *Name* | Student Push Notification |
| --- | --- |
| *Actor* | Notification System |
| *Description* | Sends produced notification to the actor Student. |
| *Preconditions* | Student has opted into receiving push Notifications |
| *Normal flow* | 1. Notification System recurringly fetches information from other actors, namely Sigarra and Moodle APIs.<br>2. System checks for modified data.<br>3. If new data is found, a new notification is produced based on the modified data.<br>4. Produced notification sent to actor Student's device. |
| *Alternative flows and exceptions* |  |

<br>

| *Name* | Add to Notification Dashboard  |
| --- | --- |
| *Actor* |  Notification System |
| *Description* | Adds produced notification to Notification Dashboard |
| *Postconditions* | - The Notification Dashboard is updated with the new notification(s) produced.<br>- Notifications older than 30 days old are deleted / dismissed.  |
| *Normal flow* | 1. Notification System recurringly fetches information from other actors, namely Sigarra and Moodle APIs.<br>2. System checks for modified data.<br>3. If new data is found, a new notification is produced based on the modified data.<br>4. Produced notification added to the Notification Dashboard. |
| *Alternative flows and exceptions* |  |

<br>

| *Name* | Add Exams to personal Calendar |
| --- | --- |
| *Actor* |  Student |
| *Description* | The student wants to add Exams to their personal calendar (on their device) |
| *Preconditions* | - The student has exames in the "Mapa de Exames" section. <br> - The student has an external calendar app (Google or Apple). |
| *Normal flow* | 1. The student accesses the "Mapa de Exames" section <br> 2. The system shows the list of exams and their dates.<br> 3. The student selects one of the exames and clicks add to calendar button. <br> 3. The app sends to an external calendar API the information regarding the exam. |


## [User Stories](https://github.com/LEIC-ES-2021-22/3LEIC04T5/labels/User%20Story)


## Domain Model

This domain model starts with a Course class that connects with the information class which indicates all the information topics about each course. At the same time all the courses have students (student class) that will receive notifications on the notification dashboard and on the students phone(Notification class) whenever there is a change or a new course information or exam date. Also the students class connects to the external calendar class and the app calender where the student will have the ability to add all the information to his/her personal calendar. 

![image](https://user-images.githubusercontent.com/93486139/161397252-e73e4740-f998-4b1f-b741-55ef47886645.png)

## Architecture and Design

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.

### Logical architecture

![Logical](https://user-images.githubusercontent.com/49955825/164213640-fe8ec790-95f2-4e00-8294-5ee658a26e31.jpg)

### Physical architecture

The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams (Deployment View) or component diagrams (Implementation View), separate or integrated, showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for uni4all are, for example, frameworks for mobile applications (such as Flutter).

Example of UML deployment diagram showing a deployment view of the Eletronic Ticketing System (please notice that, instead of software components, one should represent their physical/executable manifestations for deployment, called artifacts in UML; the diagram should be accompanied by a short description of each node and artifact):

DeploymentView

### Vertical prototype

For the vertical prototype we have implemented a simple credit page where we display the name of our feature and who it was developed by.

<img width="405" alt="Vertical Prototype" src="https://user-images.githubusercontent.com/49955825/164213275-c05e48fa-0f6d-4c7c-bb16-9dfeaa4689fe.png">
