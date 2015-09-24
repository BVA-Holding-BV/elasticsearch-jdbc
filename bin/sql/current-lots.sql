SELECT l.id as "_id",
       'lot' as "_type",
       a.active as "auction.active",
       a.id as "auction.id",
       a.name as "auction.name",
       a.description as "auction.description",
       a.keywords as "auction.keywords",
       a.startdate as "auction.startdate",
       a.enddate as "auction.enddate",
       l.id as "id",
       l.lotnumber as "number",
       l.description as "description",
       l.startdate as "startdate",
       l.enddate as "enddate",
       l.approved as "approved",
       l.bidmethodtype as "bidMethodType",
       l.visibleinhotlist as "visibleInHotList",
       l.startamount as "startAmount",
       l.minimumamount as "minimumAmount",
       l.name as "name",
       CONCAT(CONCAT(SUBSTR(NVL(loc.latitude,'0'), 0,6), ','), SUBSTR(NVL(loc.longitude,'0'), 0, 6)) as "location",
       loc.city as "city"
FROM bva.auctions a, bva.lots l, bva.locations loc
WHERE
  l.auction_id = a.id
  AND l.location_id = loc.id
  AND a.LOTMAXDATE > (CURRENT_TIMESTAMP(0) - interval '15' minute)