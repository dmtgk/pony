drop table if exists Groups;
drop table if exists Zach;
drop table if exists Students;
drop table if exists Subjects;
drop table if exists Exams;
drop table if exists Group_Subject;

create table Groups(
  number varchar(6) primary key,
  kaf integer not null
);

insert into Groups values ('4145', 44);
insert into Groups values ('4146', 44);
insert into Groups values ('3132', 33);

create table Students(
  id integer primary key,
  fio varchar(50) not null,
  passport integer unique not null,
  group_number varchar(6) references Groups(number),
  stipendy integer not null default 0
);

insert into Students values(101, 'Иванов А.Б.', 111, '4145', 0);
insert into Students values(102, 'Петров В.Г', 222, '4145', 800);
insert into Students values(103, 'Сидоров Д.Е', 333, '4145', 0);
insert into Students values(104, 'Васильев П.Ф.', 444, '3132', 500);
insert into Students values(105, 'Степанов Д.Ю.', 555, '3132', 1000);

create table Zach(
  number varchar(10) primary key,
  student integer unique references Students(id)
);
insert into Zach values('z-001', 101);
insert into Zach values('z-002', 102);
insert into Zach values('z-003', 103);

create table Subjects(
  name varchar(50) primary key
);

insert into Subjects values('Физика');
insert into Subjects values('Химия');
insert into Subjects values('Математика');

create table Group_Subject(
  group_number varchar(6) not null references Groups(number),
  subject_name varchar(50) not null references Subjects(name),
  primary key (group_number, subject_name)
);

insert into Group_Subject values('4145', 'Физика');
insert into Group_Subject values('4145', 'Химия');
insert into Group_Subject values('4145', 'Математика');
insert into Group_Subject values('3132', 'Физика');
insert into Group_Subject values('3132', 'Математика');

create table Exams(
  id integer primary key,
  student integer not null references Students(number),
  subject varchar(50) not null references Subjects(name),
  value integer not null,
  unique (student, subject)
);

insert into Exams values (1, 101, 'Физика', 4);
insert into Exams values (2, 101, 'Математика', 3);
insert into Exams values (3, 102, 'Химия', 5);
insert into Exams values (4, 103, 'Физика', 2);
insert into Exams values (5, 103, 'Химия', 4);