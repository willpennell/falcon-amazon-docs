use FalconAmazonDB

BULK INSERT dbo.tbl_users
FROM 'filepath to csv'
WITH (
    FORMATFILE = 'file path to xml',
    FIRSTROW = 2 -- skip the header row
);
