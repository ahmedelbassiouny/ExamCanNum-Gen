# ExamCanNum-Gen
Generates exam numbers and randomized seating numbers for exams.

When I was an administrator, I used to manage exams. Part of my job was to create numbers to go on exam sheets, and then to create candidate forms to have randomized numbers. The candidate forms are given to students as they enter the exam hall, and that determines where in the room they sit so they match the number on the exam booklet. That was how we managed randomized seating.

This script is for exam administrators who need to generate exam numbers to put at the back (or front) of exams. Additionally, if you need to generate numbers for randomized seating, this is your tool. The script generates numbers that can then be inserted into word documents using mailmerge. The process is fairly simple, you generate the numbers you need to go on the 

The script needs only two pieces of information: (1) number of total exams, and (2) number of exam versions [this is important so that it can also separate the numbers by version. If you have two test versions, it will generate mnumbers such that you have alternating versions].

Example:
ECNumGen.sh 250 2
[This will generate a folder with CANDIDATE_FORMS.txt which has randomized numbers for random seating, and VERSION1.txt and VERSION2.txt which have numbers to go on exams of version 1 and 2 respectively]

The script allows up to 5 exam versions.
