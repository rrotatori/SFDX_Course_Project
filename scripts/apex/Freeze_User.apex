// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

List<UserLogin> users = [SELECT IsFrozen,UserId FROM UserLogin WHERE UserId IN 
    (SELECT Id FROM User WHERE Profile.Name = 'Read Only Clone' 
    AND UserType = 'Standard' AND IsActive=True)];

    for (UserLogin ul : users) { 
        ul.isFrozen = False; 
    }

    update(users);