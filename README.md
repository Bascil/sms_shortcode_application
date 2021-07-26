# PHP package for SMS Shortcode

Hi Guys, this is a PHP package for an SMS shortcode application such as sending admission number to a shortcode such as 25551.An SMS message is then sent to the users handset through the `Africa's Talking` API.This is developed on sandbox (testing) mode. To go live contact `Africa's Talking Ltd` on https://www.africastalking.com/contact.

## Prerequisites

For testing download `Africa's Talking` android app from Google Playstore or use the web interface at https://simulator.africastalking.com:1517/.It is recommended to use the android app for better experience.

## Installation

This project supports both composer dependency management tool and can also be used without composer

### Using Composer

Run the following command

```
composer require bascil/sms_shortcode_application

```

### Without composer

Download the source code as zipped

## Configuration

1. Import the message_table.sql file into MySQL database.

2. Configure the database connection using dbConnector.php file

```
<?php
     /* Configure Database */

     $conn = 'mysql:dbname=ussd_sample;host=127.0.0.1;'; //database name
     $user = 'root'; // your mysql user
     $password = ''; // your mysql password

     //  Create a PDO instance that will allow you to access your database
     try {
        $db = new PDO($conn, $user, $password);
     }

    catch(PDOException $e) {
     //var_dump($e);
        echo("PDO error occurred");
    }

    catch(Exception $e) {
    //var_dump($e);
    echo("Error occurred");
    }

?>

```

2. Modify the phone number to the phone number you have configured in your app in the message_table.sql file.You may leave the admission number as it is or change it if you wish.

```
    CREATE TABLE `message_table` (
      `id` int(11) NOT NULL,
      `student_name` varchar(50) NOT NULL,
      `adm` varchar(5) NOT NULL,
      `fee_balance` varchar(6) NOT NULL,
      `phone_number` varchar(15) NOT NULL,
      `date_posted` datetime NOT NULL
    ) ENGINE=MyISAM DEFAULT CHARSET=latin1;


    INSERT INTO `message_table` (`id`, `student_name`, `adm`, `fee_balance`, `phone_number`, `date_posted`) VALUES
    (1, 'Basil Ndonga', '4567', '13000', '+254728986084', '2018-06-20 11:14:00');


    ALTER TABLE `message_table`
      ADD PRIMARY KEY (`id`);


    ALTER TABLE `message_table`
      MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

```

4. Go to "https://account.africastalking.com/". Create an account then click on the `Go to Sandbox App` button

5. Configure your SMS callback URL for incoming messages (`SMS Callback URLs > Incoming Messages` ) e.g http://www.example.com/folder_name/sms.php then click `Submit`. This assumes you are working from a live server whose domain name is example.com.Replace the domain name with your own.

6. If working from localhost you can set up a `Ngrok` server or `Localtunnel` to expose your localhost to the internet. Use the temporary URL provided as your callback e.g http://6a71f5ec.ngrok.io/folder_name/ussd.php. This only works when the computer is on and connected to the internet. If using `Ngrok` free package this address may change every 8 hours. You could opt for a paid version at 5 US dollars a month.

7. Go to `Settings > API key` and enter your password to generate an API key. Look for a file named `config.php` and set your username as `sandbox` and the api key as the one you have generated.

8. Configure an test SMS shortcode(mine was 25551). This will be used for SMS messages allow you to interact with `Africa's Talking` SMS APIs. Go to `Shortcodes > Create Shortcode` to create an SMS shortcode for testing.

### Usage

```

     try{
        $recipients = $from;
        $gateway= new AfricasTalkingGateway($username, $apikey,"sandbox");
        $gateway->sendMessage($recipients,$message,"25551");


    }
    catch(AfricasTalkingGatewayException $e){

        echo $e->getMessage();
      }

```

9. Now test the shortcode application using `Africa's Talking` android app downloaded from Google Playstore or use the web interface at https://simulator.africastalking.com:1517/ using the shortcode you configured i.e. `25551`.Make sure you configure a phone number similar to the one created in step 2.

## Linux Hosting

If you need VPS or dedicated hosting, please visit this link [Server Host](https://serverhost53.com)

## Support

Need support using this package:-

Email basilndonga@gmail.com or skype me at `basilndonga`.

If you wish to be added as a contributor to this project let me know. If you wish to buy me a drink, you can support me on [patreon](https://www.patreon.com/bascil).

If you were inspired by this project, don't forget to follow me on github and on twitter `@basilndonga` as well.

If you wish to engage me as a developer for your project, feel free to contact me

## License

This USSD Package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).

Happy coding!!!!!!!
