SELECT a.id as "_id",
'auction' as "_type",
a.id as "id",
a.active as "active",
a.name as "name",
a.description as "description",
a.keywords as "keywords",
a.startdate as "startdate",
a.enddate as "enddate",
l.id as "lot[id]",
l.lotnumber as "lot[number]",
l.description as "lot[description]",
l.startdate as "lot[startdate]",
l.enddate as "lot[enddate]",
l.approved as "lot[approved]",
l.bidmethodtype as "lot[bidMethodType]",
l.visibleinhotlist as "lot[visibleInHotList]",
l.startamount as "lot[startAmount]",
l.minimumamount as "lot[minimumAmount]",
l.name as "lot[name]",
CONCAT(CONCAT(SUBSTR(NVL(loc.latitude, '0'), 0,6), ','), SUBSTR(NVL(loc.longitude, '0'), 0, 6)) as "lot[location]",
loc.city as "lot[city]"
FROM bva.auctions a, bva.lots l, bva.locations loc
WHERE
l.auction_id = a.id
AND l.location_id = loc.id
AND a.LOTMAXDATE > (CURRENT_TIMESTAMP(0) - interval '15' minute)
