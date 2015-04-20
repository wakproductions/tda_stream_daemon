TD Ameritrade Stream Daemon
===========================

This tool implements the TD Ameritrade Interface gem to stream real-time quotes on a watchlist of stocks.
I use it to spot sudden intraday movements in stock price. It uses a range based measure on the 5min Average True Range 
technical indicator to spot such moves.

Here is some sample output from Friday, April 17, 2015. I use the 'say' command on the Mac console to generate
an audible alert whenever it finds activity of interest.

    Processing current time 1009, (bucket 1010), 2015-04-17 10:09:32 -0400
    Processing current time 1014, (bucket 1015), 2015-04-17 10:14:36 -0400
    Alert on POST at 1020: {:time=>1019, :after_hours_ok=>true, :last=>47.82, :volume=>88622, :true_range=>0.5799999999999983, :avg_true_range_5=>0.49426229508196673}
    Processing current time 1020, (bucket 1025), 2015-04-17 10:19:59 -0400
    Alert on WAGE at 1025: {:time=>1024, :after_hours_ok=>true, :last=>50.2, :volume=>52870, :true_range=>0.6900000000000048, :avg_true_range_5=>0.6778688524590155}
    Processing current time 1025, (bucket 1030), 2015-04-17 10:25:20 -0400
    Processing current time 1031, (bucket 1035), 2015-04-17 10:31:21 -0400
    Processing current time 1037, (bucket 1040), 2015-04-17 10:37:40 -0400
    Processing current time 1044, (bucket 1045), 2015-04-17 10:44:25 -0400
    Alert on INCR at 1050: {:time=>1049, :after_hours_ok=>true, :last=>30.0, :volume=>35200, :true_range=>0.7600000000000016, :avg_true_range_5=>0.6663934426229505}
    Processing current time 1051, (bucket 1055), 2015-04-17 10:51:11 -0400
    Processing current time 1057, (bucket 1100), 2015-04-17 10:57:55 -0400
    Processing current time 1104, (bucket 1105), 2015-04-17 11:04:37 -0400
    Processing current time 1111, (bucket 1115), 2015-04-17 11:11:42 -0400
    Alert on QCOM at 1120: {:time=>1117, :after_hours_ok=>true, :last=>67.68, :volume=>4320323, :true_range=>0.5, :avg_true_range_5=>0.48934426229509004}
    Processing current time 1119, (bucket 1120), 2015-04-17 11:19:15 -0400
    Processing current time 1127, (bucket 1130), 2015-04-17 11:27:15 -0400
    Processing current time 1134, (bucket 1135), 2015-04-17 11:34:24 -0400
    Processing current time 1142, (bucket 1145), 2015-04-17 11:41:59 -0400
    Processing current time 1150, (bucket 1155), 2015-04-17 11:50:50 -0400
    Processing current time 1159, (bucket 1200), 2015-04-17 11:59:48 -0400
    Processing current time 1208, (bucket 1210), 2015-04-17 12:08:42 -0400
    Processing current time 1218, (bucket 1220), 2015-04-17 12:17:56 -0400
    Processing current time 1227, (bucket 1230), 2015-04-17 12:27:19 -0400
    Processing current time 1237, (bucket 1240), 2015-04-17 12:36:55 -0400
    Processing current time 1247, (bucket 1250), 2015-04-17 12:47:53 -0400
    Processing current time 1258, (bucket 1300), 2015-04-17 12:58:11 -0400
    Processing current time 1308, (bucket 1310), 2015-04-17 13:08:40 -0400
    Alert on NTAP at 1320: {:time=>1315, :after_hours_ok=>true, :last=>36.34, :volume=>1722157, :true_range=>0.490000000000002, :avg_true_range_5=>0.3614754098360682}
    Processing current time 1318, (bucket 1320), 2015-04-17 13:18:52 -0400
    Processing current time 1328, (bucket 1330), 2015-04-17 13:28:26 -0400
    Processing current time 1337, (bucket 1340), 2015-04-17 13:36:55 -0400
    Processing current time 1346, (bucket 1350), 2015-04-17 13:46:20 -0400
    Processing current time 1355, (bucket 1400), 2015-04-17 13:55:06 -0400
    Alert on DTV at 1400: {:time=>1355, :after_hours_ok=>true, :last=>86.15, :volume=>1479225, :true_range=>0.6299999999999955, :avg_true_range_5=>0.45819672131148154}
    Processing current time 1402, (bucket 1405), 2015-04-17 14:02:35 -0400
    Processing current time 1409, (bucket 1410), 2015-04-17 14:09:41 -0400
    Processing current time 1416, (bucket 1420), 2015-04-17 14:16:30 -0400
    Alert on MYL at 1420: {:time=>1419, :after_hours_ok=>true, :last=>69.21, :volume=>5503460, :true_range=>2.1999999999999886, :avg_true_range_5=>1.303278688524587}
    Alert on PRGO at 1425: {:time=>1420, :after_hours_ok=>true, :last=>196.7, :volume=>1612193, :true_range=>3.4000000000000057, :avg_true_range_5=>3.352459016393436}
    Processing current time 1423, (bucket 1425), 2015-04-17 14:22:58 -0400
    Processing current time 1430, (bucket 1435), 2015-04-17 14:30:41 -0400
    Processing current time 1437, (bucket 1440), 2015-04-17 14:37:32 -0400
    Processing current time 1445, (bucket 1450), 2015-04-17 14:45:38 -0400
    Processing current time 1453, (bucket 1455), 2015-04-17 14:52:57 -0400
    Processing current time 1500, (bucket 1505), 2015-04-17 15:00:45 -0400
    Processing current time 1508, (bucket 1510), 2015-04-17 15:08:16 -0400
    Processing current time 1515, (bucket 1520), 2015-04-17 15:15:29 -0400
    Processing current time 1522, (bucket 1525), 2015-04-17 15:21:59 -0400
    Processing current time 1528, (bucket 1530), 2015-04-17 15:28:32 -0400
    Processing current time 1534, (bucket 1535), 2015-04-17 15:34:08 -0400
    Processing current time 1539, (bucket 1540), 2015-04-17 15:39:24 -0400
    Processing current time 1544, (bucket 1545), 2015-04-17 15:44:32 -0400
    Processing current time 1548, (bucket 1550), 2015-04-17 15:48:34 -0400
    Alert on SODA at 1555: {:time=>1550, :after_hours_ok=>true, :last=>20.27, :volume=>270759, :true_range=>0.16999999999999815, :avg_true_range_5=>0.1672131147540989}
    Processing current time 1552, (bucket 1555), 2015-04-17 15:52:02 -0400
    Processing current time 1555, (bucket 1600), 2015-04-17 15:55:13 -0400
    Processing current time 1557, (bucket 1600), 2015-04-17 15:57:46 -0400
    Processing current time 1559, (bucket 1600), 2015-04-17 15:59:37 -0400