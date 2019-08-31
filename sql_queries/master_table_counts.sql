SELECT COUNT(patent.id) AS no_patent_rows, COUNT(DISTINCT(patent.id)) AS unique_patent_ids

#patent.id AS patent_id, patent.date, patent.title, uspatentcitation.citation_id, 
 #      location.id AS location_id, location.city, location.country AS location_country, 
  #     location.longitude, location.latitude,
   #    CONCAT(location.longitude, ',', location.latitude)
  

FROM `patents-public-data.patentsview.uspatentcitation` uspatentcitation, 
  `patents-public-data.patentsview.patent` patent, 
  `patents-public-data.patentsview.patent_inventor` patent_inventor, 
  `patents-public-data.patentsview.location_inventor` location_inventor, 
  `patents-public-data.patentsview.location` location,
  `patents-public-data.patentsview.ipcr` ipcr
  

WHERE patent.id = uspatentcitation.patent_id
AND patent_inventor.patent_id =patent.id
AND location_inventor.inventor_id = patent_inventor.inventor_id
AND location.id = location_inventor.location_id
AND location.country = "US"


