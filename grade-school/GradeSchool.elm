module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Grade (List Student)


addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    Dict.update grade (addStudentToList student) school


addStudentToList : Student -> Maybe (List Student) -> Maybe (List Student)
addStudentToList student maybeList =
    case maybeList of
        Just students ->
            Just <| List.sort (student :: students)

        Nothing ->
            Just [ student ]


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    Dict.get grade school |> Maybe.withDefault []


allStudents : School -> List ( Grade, List Student )
allStudents school =
    Dict.toList school


empty : School
empty =
    Dict.empty
