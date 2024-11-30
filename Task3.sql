/* 1.) Assuming BuildingID = 2 */
SELECT *
FROM Apartment
WHERE BuildingID = 2
ORDER BY ApartmentType;

/* 2.) */


/* 3.) */


/* 4.) */
SELECT b.BuildingID, SUM((TO_DAYS(bo.EndTime) - TO_DAYS(bo.StartTime)) * 100) AS TotalRevenue
FROM Building AS b
JOIN Apartment AS a ON b.BuildingID = a.BuildingID
JOIN Booking AS bo ON a.ApartmentID = bo.ApartmentID
WHERE bo.Status = 'Confirmed'
OR bo.Status = 'Completed'
GROUP BY b.BuildingID;

/* 5.) */
SELECT g.Name AS Name, COUNT(b.GuestID) AS Bookings
FROM Guest AS g, Booking AS b
WHERE g.GuestID = b.GuestID
GROUP BY Name
HAVING Bookings > 2;

/* 6.) */


/* 7.) */

