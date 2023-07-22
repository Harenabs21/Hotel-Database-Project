------- LIST OF ROOMS THAT MEET MULTIPLE CRITERIA
--->
    SELECT *
    FROM "room" ro
        INNER JOIN "room_features" ro_f ON ro.id_room_features = ro_f.id
    WHERE ro_f.sea_view = true -- or false
        AND ro_f.vip_category = true -- or false
        AND ro_f.hot_water = true -- or false
        AND ro_f.wifi_available = true -- or false
        AND ro_f.room_service = true -- or false
        AND ro_f.mini_bar = true -- or false
        AND ro_f.flat_screen = true; -- or false
                                --->