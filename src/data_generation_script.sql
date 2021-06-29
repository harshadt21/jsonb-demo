create extension "uuid-ossp";


CREATE OR REPLACE FUNCTION public.generate_data(
)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS
$BODY$
DECLARE
    _i             int := 0;
    _randomNumber  decimal;
    _serial_number int;
    _color         varchar;
    _software      varchar;
    _ram           varchar;
    _hdd_size      varchar;
    _license_key   uuid;
    _date          date;

BEGIN
    WHILE _i < 1000000
        LOOP

            SELECT _i + 1000000000 INTO _serial_number;
            SELECT random() * 1000 INTO _randomNumber;

            if _randomNumber > 950 and _randomNumber < 1000 then
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('keyboard', 'Logitech', _serial_number, '{
                  "brand": "Logitech",
                  "numberOfButtons": 1,
                  "keyboardDescription": "Multi Functional",
                  "numberOfKeys": 1,
                  "model": "920-007558",
                  "modelName": "K380",
                  "modelYear": "2015",
                  "productDimensions": " 27.69 x 12.45 x 1.52 cm; 408.23 Grams",
                  "batteries": "1 A batteries required. (included)",
                  "itemModelNumber": " 920-007558",
                  "hardwarePlatform": " PC: Windows 7, Windows 8, Windows 10 or later Mac: Mac OS 10.10 or later Chrome OS Android tablet or smartphone: Android 3.2 or later. iPad or iPhone: iOS 5 or later Apple TV 2nd or 3rd generation",
                  "hardwareInterface": " Bluetooth",
                  "compatibleDevices": " Laptop, PC, Tablet",
                  "specialFeatures": " Bluetooth",
                  "mountingHardware": " Bluetooth Keyboard",
                  "aspectRatio": "Unknown",
                  "batteryAverageLife": "17520 Hours",
                  "batteriesIncluded": "Yes",
                  "batteriesRequired": "Yes",
                  "batteryCellComposition": "Lithium Ion",
                  "wirelessType": "Bluetooth",
                  "connectorType": "Wireless",
                  "containsLiquidContents": "No",
                  "manufacturer": "Logitech",
                  "countryOfOrigin": "China",
                  "itemWeight": "408 g"
                }'::jsonb);
            end if;

            if _randomNumber > 900 and _randomNumber < 950 then
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('keyboard', 'HP', _serial_number, '{
                  "brand": "HP",
                  "model": "100",
                  "productDimensions": "45 x 14.8 x 2.5 cm; 490 Grams",
                  "itemModelNumber": "100",
                  "specialFeatures": "USB Compatibility",
                  "mountingHardware": "1 Wired USB Keyboard",
                  "numberOfItems": "1",
                  "batteriesIncluded": "No",
                  "batteriesRequired": "No",
                  "keyboardDescription": "Flexible",
                  "connectorType": "Wired",
                  "hasAutoFocus": "No",
                  "programmableButtons": "No",
                  "manufacturer": "hp",
                  "importedBy": "HP India Sales Private Limited, 24 Salarpuria Arena,Hosur Main Road, Audgodi, Bangalore",
                  "itemWeight": "490 g"
                }'::jsonb);
            end if;

            if _randomNumber > 800 and _randomNumber < 900 then
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('keyboard', 'Logitech', _serial_number, '{
                  "brand": "Logitech",
                  "model": "920-006342",
                  "modelYear": "2014",
                  "productDimensions": "30.99 x 4.09 x 20.1 cm; 821 Grams",
                  "batteries": "1 Lithium Polymer batteries required. (included)",
                  "itemModelNumber": "920-006342",
                  "hardwarePlatform": "Bluetooth",
                  "hardwareInterface": "Bluetooth",
                  "compatibleDevices": "Laptop, PC, Tablet, Smartphone",
                  "specialFeatures": "Basic",
                  "mountingHardware": "Keyboard 2 AAA batteries (pre-installed) User documentation",
                  "batteriesIncluded": "Yes",
                  "batteriesRequired": "Yes",
                  "batteryCellComposition": "Alkaline",
                  "connectorType": "Wireless",
                  "containsLiquidContents": "No",
                  "hasAutoFocus": "No",
                  "includesRechargeableBattery": "No",
                  "programmableButtons": "No",
                  "manufacturer": "Logitech",
                  "itemWeight": "821 g"
                }'::jsonb);
            end if;


            if _randomNumber > 700 and _randomNumber < 800 then
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('mouse', 'Dell', _serial_number, '{
                  "brand": "Dell",
                  "itemHeight": "14.2 Centimeters",
                  "itemWidth": "46 Millimeters",
                  "productDimensions": "9.1 x 4.6 x 14.2 cm; 140 Grams",
                  "manufacturer": "Dell Computers",
                  "countryOfOrigin": "India",
                  "itemWeight": "140 g"
                }'::jsonb);
            end if;

            if _randomNumber > 650 and _randomNumber < 700 then
                select (array ['Black', 'White', 'Navy Blue'])[floor(random() * 3 + 1)] into _color;
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('mouse', 'Logitech', _serial_number, concat('{
                  "brand": "Logitech",
                  "manufacturer": "Logitech",
                  "colour": "', _color, '",
                  "itemHeight": "35 Millimeters",
                  "itemWidth": "6.2 Centimeters",
                  "productDimensions": "9.8 x 6.2 x 3.5 cm; 68 Grams",
                  "batteries": "1 A batteries required. (included)",
                  "itemModelNumber": "B170",
                  "wirelessType": "2.4 GHz Radio Frequency",
                  "operatingSystem": "Chrome os, Windows 8, Windows 7, Mac os, Windows 10",
                  "averageBatteryLife (in hours)": "12 Months",
                  "areBatteriesIncluded": "Yes",
                  "includedComponents": "Wireless Mouse, USB Receiver, 1 AA Battery (Pre-Installed), User Documentation",
                  "countryOfOrigin": "China",
                  "itemWeight": "68 g"
                }')::jsonb);
            end if;

            if _randomNumber > 600 and _randomNumber < 650 then
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('headphones', 'BoAt', _serial_number, '{
                  "brand": "BoAt",
                  "model": "Rockerz 450",
                  "modelName": "Rockerz 450",
                  "productDimensions": "8 x 18.2 x 17.6 cm; 168 Grams",
                  "batteries": "1 Lithium ion batteries required. (included)",
                  "itemModelNumber": "Rockerz 450",
                  "compatibleDevices": "All Bluetooth Devices",
                  "specialFeatures": "Android Phone Control, IOS Phone Control, Lightweight, Volume-Control, Foldable, Microphone Feature",
                  "mountingHardware": "Rockerz 450, Charging Cable, User Manual, Warranty Card",
                  "numberOfItems": "4",
                  "microphoneFormFactor": "In-Line;Built-In",
                  "headphonesFormFactor": "On Ear",
                  "batteriesIncluded": "Yes",
                  "batteriesRequired": "Yes",
                  "batteryCellComposition": "Lithium",
                  "connectorType": "Wireless",
                  "includesRechargable Battery": "Yes",
                  "manufacturer": "Imagine Marketing Pvt Ltd",
                  "countryOfOrigin": "China",
                  "itemWeight": "168 g"
                }');
            end if;

            if _randomNumber > 500 and _randomNumber < 600 then
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('monitor', 'LG', _serial_number, '{
                  "model": "32QN600",
                  "modelName": "IPS Monitor",
                  "productDimensions": "20.9 x 71.4 x 51.2 cm; 7.2 Kilograms",
                  "itemModelNumber": "32QN600",
                  "hardwareInterface": "DisplayPort, HDMI",
                  "responseTime": "5 Milliseconds",
                  "specialFeatures": "Anti Glare Screen, QHD (2560 x 1440) Resolution with HDR 10, Blue Light Filter, Wall Mountable, Thin Bezel, Tilt Adjustment, Flicker-Free",
                  "mountingHardware": "1 Unit of Monitor, 1 Unit of adapter & cable",
                  "displayTechnology": "LCD",
                  "standingScreenDisplaySize": "31.5 Inches",
                  "displayType": "LED",
                  "imageBrightness": "350 cd / m²",
                  "resolution": "2560x1440",
                  "batteriesRequired": "No",
                  "refreshRate": "75",
                  "connectorType": "HDMI",
                  "mountingType": "Wall Mount",
                  "manufacturer": "LG Electronics Nanjing New Technology Co.,Ltd",
                  "countryOfOrigin": "China",
                  "importedBy": "LG Electronics India Pvt Ltd",
                  "itemWeight": "7 kg 200 g"
                }'::jsonb);
            end if;

            if _randomNumber > 400 and _randomNumber < 500 then
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('monitor', 'Acer', _serial_number, '{
                  "brand": "Acer",
                  "manufacturer": "Acer India Pvt Ltd",
                  "model": "ET322QK",
                  "modelYear": "2018",
                  "productDimensions": "24.64 x 72.9 x 52.83 cm; 5.62 Kilograms",
                  "itemModelNumber": "ET322QK",
                  "hardwareInterface": "DisplayPort, HDMI",
                  "responseTime": "4 Milliseconds",
                  "specialFeatures": "Blue Light Filter, Wall Mountable, Flicker-Free, Built-In Speakers",
                  "mountingHardware": "Main Unit and Power Cord",
                  "numberOfItems": "5",
                  "displayTechnology": "LED",
                  "standingScreenDisplaySize": "31.5 Inches",
                  "displayType": "LED",
                  "viewingAngle": "178 Degrees",
                  "imageAspectRatio": "16:9",
                  "imageBrightness": "300 cd / m²",
                  "imageContrastRatio": "3000:1",
                  "aspectRatio": "16:9",
                  "resolution": "3840 x 2160 Pixels",
                  "maxVerticalResolution": "2160 Pixels",
                  "speakersNominalOutputPower": "2 Watts",
                  "voltage": "120 Volts",
                  "wattage": "4 Watts",
                  "batteriesIncluded": "No",
                  "batteriesRequired": "No",
                  "refreshRate": "60 Hz",
                  "connectorType": "DisplayPort, HDMI",
                  "realAngleOfView": "178 Degrees",
                  "containsLiquidContents": "No",
                  "countryOfOrigin": "China",
                  "importedBy": "ACER INDIA PRIVATE LIMITED Embassy Heights, 6th Floor, No. 13 Magrath Road, Next to HOSMAT Hospital, Bangalore, INDIA – 560030",
                  "itemWeight": "5 kg 620 g"
                }'::jsonb);
            end if;

            if _randomNumber > 350 and _randomNumber < 400 then
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('ups', 'APC', _serial_number, '{
                  "brand": "APC",
                  "manufacturer": "APC",
                  "model": "BX600C-IN",
                  "modelName": "BX600C-IN",
                  "productDimensions": "23.7 x 10.7 x 21.8 cm; 4.69 Kilograms",
                  "batteries": "1 Lithium Polymer batteries required. (included)",
                  "itemModelNumber": "BX600C-IN",
                  "specialFeatures": "Automatic Voltage Regulation (AVR) corrects incoming voltage, Compatible with low power loads e.g. wifi router, DSL modem, Faster charging 4-6 hours, 2 Year Warranty: covers parts & labor, including battery, Separate Charging LED",
                  "mountingHardware": "UPS, User Manual and Warranty card",
                  "numberOfItems": "1",
                  "audioWattage": "360 Watts",
                  "wattage": "360 Watts",
                  "batteryAverage Life": "3 Years",
                  "batteryAverage Life Standby": "20 Minutes",
                  "chargingTime": "4 Hours",
                  "batteriesIncluded": "Yes",
                  "batteriesRequired": "Yes",
                  "batteryCellComposition": "Lead Acid",
                  "hasAutoFocus": "No",
                  "programmableButtons": "No",
                  "countryOfOrigin": "India",
                  "itemWeight": "4 kg 690 g"
                }'::jsonb);
            end if;

            if _randomNumber > 325 and _randomNumber < 350 then
                select (array ['Black', 'White', 'Navy Blue', 'Silver', 'Sky Blue'])[floor(random() * 5 + 1)]
                into _color;
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('Laptop Bag', 'WildCraft', _serial_number, concat('{
                  "brand": "WildCraft",
                  "series": "WildCraft Polyester Laptop Sleeve Cover Bag 15.6 inch For MacBook / Lenovo / Dell / Surface Pro / Asus / HP / Acer ( Grey_L22, 180 Degree opening)",
                  "colour": "', _color, '",
                  "itemHeight": "16 Inches",
                  "itemWidth": "1.2 Inches",
                  "productDimensions": "27.94 x 3.05 x 40.64 cm; 200 Grams",
                  "itemModelNumber": "L22",
                  "includedComponents": "1U Laptop Sleeve",
                  "manufacturer": "WildCraft",
                  "countryOfOrigin": "India",
                  "itemWeight": "200 g"
                }')::jsonb);
            end if;


            if _randomNumber > 300 and _randomNumber < 325 then
                select (array ['Black', 'White', 'Navy Blue', 'Silver', 'Sky Blue'])[floor(random() * 5 + 1)]
                into _color;
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('Laptop Bag', 'Dell', _serial_number, concat('{
                          "brand": "Dell",
                          "manufacturer": "Dell Computers",
                          "series": "DELL",
                          "colour": "', _color, '",
                          "itemHeight": "10 Centimeters",
                          "itemWidth": "3 Centimeters",
                          "productDimensions": "5 x 3 x 10 cm; 200 Grams",
                          "itemModelNumber": "PS-BP-BK-17-19",
                          "processorCount": "1",
                          "areBatteriesIncluded": "No",
                          "includedComponents": "Backpack",
                          "countryOfOrigin": "China",
                          "itemWeight": "200 g"
                        }')::jsonb);
            end if;

            if _randomNumber > 200 and _randomNumber < 300 then
                select (array ['4', '8', '16'])[floor(random() * 3 + 1)] into _ram;
                select (array ['512 GB', '1 TB', '2 TB'])[floor(random() * 3 + 1)] into _hdd_size;
                select (array ['Black', 'White', 'Navy Blue', 'Silver', 'Sky Blue'])[floor(random() * 5 + 1)]
                into _color;
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('laptop', 'HP', _serial_number, concat('{
                  "series": "Pavilion x360",
                  "colour": "Mineral Silver",
                  "itemHeight": "2.1 Centimeters",
                  "itemWidth": "22.3 Centimeters",
                  "standingScreenDisplaySize": "14 Inches",
                  "resolution": "1920 x 1080 Pixels",
                  "product Dimensions": "32.4 x 22.3 x 2.1 cm; 1.58 Kilograms",
                  "batteries": "1 Lithium ion batteries required. (included)",
                  "itemModelNumber": "14-dh1178tu",
                  "processorBrand": "Intel",
                  "processorType": "Core i3",
                  "processorSpeed": "2.1 GHz",
                  "processorCount": "1",
                  "color": "', _color, '",
                  "ramSizeInGB": "', _ram, '",
                  "hardDriveSize": "', _hdd_size, '",
                  "memoryTechnology": "DDR4",
                  "computerMemoryType": "DDR4 SDRAM",
                  "maximumMemorySupported": "16 GB",
                  "hardDiskDescription": "SSD",
                  "hardDriveInterface": "USB 3.1",
                  "speakerDescription": "B&O, dual speakers, HP Audio Boost",
                  "graphicsCoprocessor": "Intel UHD",
                  "graphicsChipsetBrand": "Intel",
                  "graphicsCardDescription": "Integrated",
                  "graphicsRAMType": "VRAM",
                  "graphicsCardInterface": "Integrated",
                  "connectivityType": "Bluetooth, Wi-Fi",
                  "numberOfUSB3Ports": "2",
                  "numberOfHDMIPorts": "1",
                  "numberOfAudioOutPorts": "1",
                  "numberOfEthernetPorts": "1",
                  "opticalDriveType": "No Optical Drive",
                  "powerSource": "Battery Powered",
                  "operatingSystem": "Windows 10 Home",
                  "supportedSoftware": "Comes with Preinstalled Microsoft Office Home & Student 2019",
                  "averageBatteryStandbyLife": "7 Hours",
                  "averageBatteryLife": "7 Hours",
                  "areBatteriesIncluded": "Yes",
                  "lithiumBatteryEnergyContent": "41 Watt Hours",
                  "lithiumBatteryWeight": "0.85 Grams",
                  "numberOfLithiumIonCells": "3",
                  "includedComponents": "Laptop, Battery, AC Adapter, User Guide, Manuals",
                  "manufacturer": "hp",
                  "countryOfOrigin": "China",
                  "importedBy": "HP India Sales Pvt. Ltd.",
                  "itemWeight": "1 kg 580 g"
                }')::jsonb);
            end if;


            if _randomNumber > 100 and _randomNumber < 200 then
                select (array ['512 GB', '1 TB', '2 TB'])[floor(random() * 3 + 1)] into _hdd_size;
                select (array ['4', '8', '16'])[floor(random() * 3 + 1)] into _ram;
                select (array ['Black', 'White', 'Navy Blue', 'Silver', 'Sky Blue'])[floor(random() * 5 + 1)]
                into _color;
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('laptop', 'Dell', _serial_number, concat('{
                  "brand": "Dell",
                  "manufacturer": "Dell India Pvt Ltd, Dell",
                  "series": "Inspiron",
                  "colour": "', _color, '",
                  "formFactor": "Laptop",
                  "itemHeight": "20 Millimeters",
                  "itemWidth": "34 Centimeters",
                  "standingScreenDisplay size": "14 Inches",
                  "resolution": "1366x768",
                  "productDimensions": "24 x 34 x 2 cm; 1.7 Kilograms",
                  "batteries": "1 Lithium ion batteries required. (included)",
                  "itemModelNumber": "3493",
                  "processorBrand": "Intel",
                  "processorType": "Core i3",
                  "processorSpeed": "1.2 GHz",
                  "processorCount": "1",
                  "ramSizeInGB": "', _ram, '",
                  "hardDriveSize": "', _hdd_size, '",
                  "memoryTechnology": "DDR4",
                  "maximumMemorySupported": "16 GB",
                  "memoryClockSpeed": "2666 MHz",
                  "hardDiskDescription": "Mechanical Hard Drive",
                  "hardDriveInterface": "Serial ATA",
                  "hardDiskRotationalSpeed": "5400 RPM",
                  "speakerDescription": "Waves Maxx",
                  "graphicsCoprocessor": "Intel HD",
                  "graphicsChipsetBrand": "Intel",
                  "graphicsCardDescription": "Integrated",
                  "graphicsRAMType": "Shared",
                  "graphicsCardInterface": "Integrated",
                  "connectivityType": "Wi-Fi, Bluetooth-V4",
                  "wirelessType": "801.11ac",
                  "numberOfUSB 2.0 Ports": "1",
                  "numberOfUSB 3.0 Ports": "2",
                  "numberOfHDMI Ports": "1",
                  "numberOfAudio-out Ports": "1",
                  "numberOfEthernet Ports": "1",
                  "numberOfMicrophone Ports": "1",
                  "frontWebcamResolution": "1 MP",
                  "powerSource": "Battery Powered",
                  "operatingSystem": "Windows 10",
                  "averageBatteryStandbyLife": "7 Hours",
                  "averageBatteryLife": "7 Hours",
                  "areBatteriesIncluded": "Yes",
                  "lithiumBatteryEnergyContent": "42 Watt Hours",
                  "lithiumBatteryWeight": "0.85 Grams",
                  "numberOfLithiumIonCells": "3",
                  "includedComponents": "Laptop, Adapter, Power Cable",
                  "importedBy": "Dell",
                  "itemWeight": "1 kg 700 g"
                }')::jsonb);
            end if;

            if _randomNumber > 50 and _randomNumber < 100 then
                select (array ['Black', 'White', 'Navy Blue'])[floor(random() * 3 + 1)] into _color;
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('keyboard', 'Amkette', _serial_number, concat('{
                  "brand": "Amkette",
                  "colour": "', _color, '",
                  "itemHeight": "4.02 Centimeters",
                  "itemWidth": "13 Centimeters",
                  "productDimensions": "52 x 13 x 4.02 cm; 625 Grams",
                  "batteries": "4    AAA batteries required. (included)",
                  "itemModelNumber": "Primus",
                  "wirelessType": "2.4 GHz Radio Frequency",
                  "powerSource": "DC",
                  "operatingSystem": "Laptop, PC, Mac, Android",
                  "areBatteriesIncluded": "Yes",
                  "includedComponents": "Keyboard, mouse, 4AAA batteries, USB Nano receiver",
                  "manufacturer": "Allied Electronics And Magnetics Private Limited",
                  "countryOfOrigin": "China",
                  "itemWeight": "625 g"
                }')::jsonb);
            end if;

            if _randomNumber > 0 and _randomNumber < 50 then
                select ((now() + concat(floor(random() * (3 - 0 + 1)) + 0, ' year')::interval) +
                        (concat(floor(random() * (12 - 1 + 1)) + 1, ' month')::interval) +
                        (concat(floor(random() * (30 - 1 + 1)) + 1, ' day')::interval))::date
                into _date;
                select uuid_generate_v4() into _license_key;
                select (array ['Intellij IDEA', 'PyCharm', 'WebStorm'])[floor(random() * 3 + 1)] into _software;
                INSERT INTO assets(name, brand, serial_number, specifications)
                VALUES ('Software', 'Jetbrains', _serial_number, concat('{
                  "product": "', _software, '",
                  "licenseKey": "', _license_key, '",
                  "expiryDate": "', _date, '"
                }')::jsonb);
            end if;


            SELECT _i + 1 INTO _i;
        END LOOP;
END;
$BODY$;

-- select generate_data();

-- select name, count(*) from assets group by name;

-- select * from assets limit 200;

-- truncate table assets;
