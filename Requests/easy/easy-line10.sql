------ DISPLAY THE LIST OF HOTELS IN A GIVEN LOCATION (PROVINCE)
--->
    SELECT * FROM "hotel" INNER JOIN province_available p ON id_province = p.id 
    WHERE p.province_name = 'Antananarivo'; --- <--- params
                                        --->
-- NOTE :
-- *params : the given location, 'Antananarivo' in this egg