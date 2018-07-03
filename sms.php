<?php
    require('AfricasTalkingGateway.php');
    require('dbConnector.php');
    require('config.php');

    // get post via AfricasTalkingGateway API
    $from = $_POST['from'];
    $to = $_POST['to'];
    $text = trim($_POST['text']);
    $date = $_POST['date'];
    $id = $_POST['id'];
    $linkId = $_POST['linkId'];


if (isset($from)){
    
    $stmt = $db->query("SELECT * FROM message_table WHERE phone_number = '{$from}' AND adm='{$text}' ORDER BY date_posted asc LIMIT 1");

    $stmt->execute();
    
    if($stmt->rowCount() > 0){

    foreach($stmt->fetchALL(PDO::FETCH_ASSOC) as $row){
            $date_posted=$row['date_posted'];
            $phpdate=strtotime($date_posted);
            $new_date=date("d/m/Y", $phpdate);
                               
            //Respond with Fee Balance
            $message="Fee Balance for " .$row['student_name']." as at " .$new_date." is Ksh.".$row['fee_balance']."\n";
            
        } 
        
    }
    
    else{
        
           $message= "Fee Balance not available at the moment\n" ; 
    }
                               
    
    try{
        $recipients = $from;
        $gateway= new AfricasTalkingGateway($username, $apikey,"sandbox");
        $gateway->sendMessage($recipients,$message,"25551"); 
        
        
    }
    catch(AfricasTalkingGatewayException $e){
        
        echo $e->getMessage();
      }
    

}
    

?>