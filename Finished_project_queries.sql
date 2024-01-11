USE data_scientist_project;

DROP VIEW IF EXISTS purchases_info;

CREATE VIEW purchases_info AS
SELECT
	*,
    CASE 
		WHEN date_end < '2021-04-01' THEN 0 
		WHEN date_start > '2021-06-30' THEN 0 
		ELSE 1 
	END AS paid_q2_2021,
	CASE 
		WHEN date_end < '2022-04-01' THEN 0 
		WHEN date_start > '2022-06-30' THEN 0 
		ELSE 1 
	END AS paid_q2_2022
FROM
(
	SELECT 
		purchase_id,
		student_id,
		plan_id,
		date_start,
		IF(date_refunded IS NULL,
			date_end,
			date_refunded) AS date_end
	FROM
		(
			SELECT 
				purchase_id,
				student_id,
				plan_id,
				date_purchased AS date_start,
				CASE
					WHEN plan_id = 0 THEN DATE_ADD(date_purchased, INTERVAL 1 MONTH)
					WHEN plan_id = 1 THEN DATE_ADD(date_purchased, INTERVAL 3 MONTH)
					WHEN plan_id = 2 THEN DATE_ADD(date_purchased, INTERVAL 12 MONTH)
					WHEN plan_id = 3 THEN CURDATE()
				END AS date_end,
				date_refunded
		FROM
			student_purchases
		) a) b ; 
        
SELECT 
  a.student_id, 
  a.minutes_watched, 
  IF(
    i.date_start IS NULL, 
    0, 
    MAX(i.paid_q2_2022)
  ) AS paid_in_q2
FROM 
  (
    SELECT 
    student_id,
    ROUND(SUM(seconds_watched) / 60, 2) AS minutes_watched
FROM
    student_video_watched
    WHERE
    YEAR(date_watched) = 2022
GROUP BY student_id
  ) a 
  LEFT JOIN purchases_info i ON a.student_id = i.student_id
GROUP BY 
  student_id
HAVING paid_in_q2 = 1;


SELECT
a.student_id,
IF(w.seconds_watched IS NULL,
	0,
	ROUND(SUM(seconds_watched) / 60, 2)) AS minutes_watched,
a.certificates_issued
FROM
	(SELECT student_id,count(certificate_id) AS certificates_issued
	FROM
		student_certificates
	group by student_id) a 
    LEFT JOIN student_video_watched w ON a.student_id = w.student_id
    GROUP BY student_id;

