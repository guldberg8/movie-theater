TRUNCATE TABLE AUTOGRADING.RESULT;
# T1: correct login
CALL Team94.user_login("georgep", "111111111");
CALL AUTOGRADING.grade(1, 'T1', 'Team94.UserLogin', 'UserLogin');
#T2: incorrect password
CALL Team94.user_login("georgep", "111110111");
CALL AUTOGRADING.grade(2, 'T2', 'Team94.UserLogin', 'UserLogin');
#T3: returns everything
CALL Team94.admin_filter_user("", "ALL", "creditCardCount", "DESC");
CALL AUTOGRADING.grade(3, 'T3', 'Team94.AdFilterUser', 'AdFilterUser');
#T4: returns approved users
CALL Team94.admin_filter_user("", "Approved", "creditCardCount", "DESC");
CALL AUTOGRADING.grade(4, 'T4', 'Team94.AdFilterUser', 'AdFilterUser');
#T5: returns everything, sort by numCityCover DESC
CALL Team94.admin_filter_company("ALL", NULL, NULL, NULL, NULL, NULL, NULL, "numCityCover", "DESC");
CALL AUTOGRADING.grade(5, 'T5', 'Team94.AdFilterCom', 'AdFilterCom');
#T6: returns companies with at least 3 employees, sort by comName DESC
CALL Team94.admin_filter_company("ALL", NULL, NULL, NULL, NULL, 3, NULL, "comName", "DESC");
CALL AUTOGRADING.grade(6, 'T6', 'Team94.AdFilterCom', 'AdFilterCom');
#T7: returns theater details for 4400 Theater Company
CALL Team94.admin_view_comDetail_th("4400 Theater Company");
CALL AUTOGRADING.grade(7, 'T7', 'Team94.AdComDetailTh', 'AdComDetailTh');
#T8: returns employee details for 4400 Theater Company
CALL Team94.admin_view_comDetail_emp("4400 Theater Company");
CALL AUTOGRADING.grade(8, 'T8', 'Team94.AdComDetailEmp', 'AdComDetailEmp');
#T9: returns all movies for manager fatherAI's theater
CALL Team94.manager_filter_th("fatherAI", "", NULL, NULL, NULL, NULL, NULL, NULL, NULL);
CALL AUTOGRADING.grade(9, 'T9', 'Team94.ManFilterTh', 'ManFilterTh');
#T10: only returns not played movies for manager fatherAI's theater
CALL Team94.manager_filter_th("fatherAI", "", NULL, NULL, NULL, NULL, NULL, NULL, TRUE);
CALL AUTOGRADING.grade(10, 'T10', 'Team94.ManFilterTh', 'ManFilterTh');
#T11: return all movies
CALL Team94.customer_filter_mov("ALL", "ALL", "", "ALL", NULL, NULL);
CALL AUTOGRADING.grade(11, 'T11', 'Team94.CosFilterMovie', 'CosFilterMovie');
#T12: return movies played after 2015-01-01
CALL Team94.customer_filter_mov("ALL", "ALL", "", "ALL", "2015-01-01", NULL);
CALL AUTOGRADING.grade(12, 'T12', 'Team94.CosFilterMovie', 'CosFilterMovie');
#T13: return view histories for georgep
CALL Team94.customer_view_history("georgep");
CALL AUTOGRADING.grade(13, 'T13', 'Team94.CosViewHistory', 'CosViewHistory');
#T14: return all theaters
CALL Team94.user_filter_th("ALL", "ALL", "", "ALL");
CALL AUTOGRADING.grade(14, 'T14', 'Team94.UserFilterTh', 'UserFilterTh');
#T15: returns theaters in 4400 Theater Company
CALL Team94.user_filter_th("ALL", "4400 Theater Company", "", "ALL");
CALL AUTOGRADING.grade(15, 'T15', 'Team94.UserFilterTh', 'UserFilterTh');
#T16: return visit history for calcwizard
CALL Team94.user_filter_visitHistory("calcwizard", NULL, NULL);
CALL AUTOGRADING.grade(16, 'T16', 'Team94.UserVisitHistory', 'UserVisitHistory');
#T17: return visit history after 2010-03-21 for calcwizard
CALL Team94.user_filter_visitHistory("calcwizard", "2010-03-21", NULL);
CALL AUTOGRADING.grade(17, 'T17', 'Team94.UserVisitHistory', 'UserVisitHistory');