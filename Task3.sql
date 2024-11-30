/* 1.) */


/* 2.) */


/* 3.) */


/* 4.) */


/* 5.) */
SELECT g.Name AS Name, COUNT(b.GuestID) AS Bookings
FROM Guest AS g, Booking AS b
WHERE g.GuestID = b.GuestID 	/* Make sure WHERE clause is included otherwise Bookings will display 20 as in the number of inserted values */
GROUP BY Name
HAVING Bookings > 2;

/* 6.) */


/* 7.) */

